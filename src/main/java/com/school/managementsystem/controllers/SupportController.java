/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.controllers;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opencsv.CSVWriter;
import com.school.managementsystem.service.ReportService;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author oreoluwa
 */
@Controller
public class SupportController implements ServletContextAware{
    
    
        static final String SAVE_DIRECTORY = "uploads";
    String fullSavePath;
    static java.util.Date date = Calendar.getInstance().getTime();
    static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");

    String today = sdf1.format(date);

  
    @Autowired
    ReportService report;


    private static ServletContext servletContext;

    @Override
    public void setServletContext(ServletContext servletCtx) {
        SupportController.servletContext = servletCtx;
    }
    
    
    
    
      @RequestMapping(value = "/downloadattendance", method = {RequestMethod.POST, RequestMethod.GET})
    public void downloadStudentAttendanceForTeacher(HttpServletRequest request,
            HttpServletResponse response, @RequestParam String reportType,
            @RequestParam(defaultValue = "") String fromDate,
            @RequestParam(defaultValue = "") String toDate) throws IOException {
        String subSql;
        String placeHolders[] = new String[3];
        String username = request.getParameter("username");
        

        System.out.println("username " + username);
        subSql = " WHERE DATE(date) BETWEEN ? AND ? AND classteacher = ?";
//        String subSql1 = " WHERE DATE(creation_date) BETWEEN ? AND ? AND de42='" + userId + "' ";
          System.out.println(subSql);
        placeHolders[0] = fromDate;
        placeHolders[1] = toDate;
        placeHolders[2] = username;
        System.out.println("sqb: " + subSql);
        String sql = "";
      
      
            sql = "SELECT (@s:= @s+1) AS SN, firstname,lastname,sex,attendance,date FROM tbl_attendance, (SELECT @s:= 0) AS sn " + subSql + " ORDER BY date DESC";
        

        System.out.println("fromDate: " + fromDate);
        System.out.println("toDate: " + toDate);
        System.out.println("sql: " + sql);
//        String[] columns = {"SN", "Date", "PAN", "MTI", "Terminal", "Type", "Amount", "STAN",
//            "MCC", "RRN", "MID", "Merchant", "Currency", "Responsecode"};
        //GT Ghana line 
        String[] columns = {"SN", "Firstname", "Lastname", "Sex", "Attendance", "Date"}; 

        String reportTitle = "Attendance Report";
        List<Map<String, Object>> getTableFields = report.getRecords(sql, columns.length, placeHolders);
// System.out.println("getTableFields"+getTableFields);

        List<String> getColumnNames = Arrays.asList(columns);

        String filepath = null;
        String filepath2 = null;
        String filename = null;
        if (!getTableFields.isEmpty()) {
            switch (reportType) {
                case "pdf":
                    filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "pdf");
                    openPdf(response, request, filepath);
                    break;
                case "csv":
                    filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "csv");
                    openCsv(response, request, filepath);
                    break;
                case "zip":
                    try {
                        filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "pdf");

                        filepath2 = getGenerateReport(getTableFields, getColumnNames, reportTitle, "csv");

                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                    String location = getPathToFile("zip");
                    filename = "service charge" + today + ".zip";
                    final int BUFFER = 2048;
                    try {
                        BufferedInputStream origin = null;
                        FileOutputStream dest = new FileOutputStream(location);
                        ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(dest));
                        byte data[] = new byte[BUFFER];

                        String files[] = {filepath, filepath2};
                        for (String filee : files) {
                            FileInputStream fi = new FileInputStream(filee);
                            origin = new BufferedInputStream(fi, BUFFER);
                            ZipEntry entry = new ZipEntry(filee);
                            out.putNextEntry(entry);
                            int count;
                            while ((count = origin.read(data, 0, BUFFER)) != -1) {
                                out.write(data, 0, count);
                            }
                            origin.close();
                        }
                        out.close();

                    } catch (IOException e) {
                        System.out.println("error:" + e.getMessage());
                    }

                    openZip(response, request, location);
                    break;
                default:
                    break;
            }
        } else {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();

            response.sendRedirect("/downloaderror");

            pw.close();
        }

    }
    
    
    
    
    
     @RequestMapping(value = "/downloadresult", method = {RequestMethod.POST, RequestMethod.GET})
             public void downloadStudentResultReport(HttpServletRequest request,
            HttpServletResponse response, @RequestParam String reportType,
            @RequestParam(defaultValue = "") String lastname,@RequestParam(defaultValue = "") String sex,
            @RequestParam(defaultValue = "") String firstname) throws IOException {
        String subSql;
        String placeHolders[] = new String[3];
//        String username = (String) request.getSession().getAttribute("username");
//        String checkUserrole = (String) request.getSession().getAttribute("userrole");
//        String userId = (String) request.getSession().getAttribute("merchantid");
//         String responsecode = (String) request.getSession().getAttribute("responsecode");
//           String fromdate = (String) request.getSession().getAttribute("fromdate");
//           String todate = (String) request.getSession().getAttribute("todate");
        System.out.println("username" + firstname); 
        subSql = " WHERE firstname = ? AND lastname = ? AND sex = ? ";
//        String subSql1 = " WHERE responsecode=? AND DATE(creation_date) BETWEEN ? AND ? AND de42='" + userId + "' ";
        placeHolders[0] = firstname;
        placeHolders[1] = lastname;
        placeHolders[2] = sex;
        System.out.println("sqb: " + subSql);  
        String sql = "";
     
            sql = "SELECT subject,assessmentone,assessmenttwo,assessmentthree,finalexam,total,grade FROM tbl_resultrecords " + subSql;
            System.out.println("sql" + sql);
     

//        System.out.println("fromDate: " + fromDate);
//        System.out.println("toDate: " + toDate);
//        System.out.println("responseCode: " + responseCode);
        System.out.println("sql: " + sql);
        String[] columns = {"Subject", "assessmentone", "assessmenttwo", "assessmentthree", "FinalExam", "Total","Grade"};
        

//        String res = ResponseInterpreter.generateResponse(responseCode);
//        String resp ="'" + res + "'";
//        String reportTitle = "Report for transactions for " + res; 
        String reportTitle = "Report for transactions for "; 
        List<Map<String, Object>> getTableFields = report.getRecords(sql, columns.length, placeHolders);
// System.out.println("getTableFields"+getTableFields);

        List<String> getColumnNames = Arrays.asList(columns);

        String filepath = null;
        String filepath2 = null;
        String filename = null;
        if (!getTableFields.isEmpty()) {
            switch (reportType) {
                case "pdf":
                    filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "pdf");
                    openPdf(response, request, filepath);
                    break;
                case "csv":
                    filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "csv");
                    openCsv(response, request, filepath);
                    break;
                case "zip":
                    try {
                        filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "pdf");

                        filepath2 = getGenerateReport(getTableFields, getColumnNames, reportTitle, "csv");

                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                    String location = getPathToFile("zip");
                    filename = "service charge" + today + ".zip";
                    final int BUFFER = 2048;
                    try {
                        BufferedInputStream origin = null;
                        FileOutputStream dest = new FileOutputStream(location);
                        ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(dest));
                        byte data[] = new byte[BUFFER];

                        String files[] = {filepath, filepath2};
                        for (String filee : files) {
                            FileInputStream fi = new FileInputStream(filee);
                            origin = new BufferedInputStream(fi, BUFFER);
                            ZipEntry entry = new ZipEntry(filee);
                            out.putNextEntry(entry);
                            int count;
                            while ((count = origin.read(data, 0, BUFFER)) != -1) {
                                out.write(data, 0, count);
                            }
                            origin.close();
                        }
                        out.close();

                    } catch (IOException e) {
                        System.out.println("error:" + e.getMessage());
                    }

                    openZip(response, request, location);
                    break;
                default:
                    break;
            }
        } else {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();

            response.sendRedirect("/downloaderror");

            pw.close();
        }

    }
    
    
    
             
             
             
             
             
             
             
             
             @RequestMapping(value = "/downloadteacherattendance", method = {RequestMethod.POST, RequestMethod.GET})
    public void downloadTeacherAttendanceForAdmin(HttpServletRequest request,
            HttpServletResponse response, @RequestParam String reportType,
            @RequestParam(defaultValue = "") String fromDate,
            @RequestParam(defaultValue = "") String toDate) throws IOException {
        String subSql;
        String placeHolders[] = new String[2];
//        String username = request.getParameter("username");
        

//        System.out.println("username " + username);
        subSql = " WHERE DATE(date) BETWEEN ? AND ?";
//        String subSql1 = " WHERE DATE(creation_date) BETWEEN ? AND ? AND de42='" + userId + "' ";
          System.out.println(subSql);
        placeHolders[0] = fromDate;
        placeHolders[1] = toDate;
//        placeHolders[2] = username;
        System.out.println("sqb: " + subSql);
        String sql = "";
      
      
            sql = "SELECT (@s:= @s+1) AS SN, firstname,lastname,sex,attendance,date FROM tbl_teacherattendance, (SELECT @s:= 0) AS sn " + subSql + " ORDER BY date DESC";
        

        System.out.println("fromDate: " + fromDate);
        System.out.println("toDate: " + toDate);
        System.out.println("sql: " + sql);
//        String[] columns = {"SN", "Date", "PAN", "MTI", "Terminal", "Type", "Amount", "STAN",
//            "MCC", "RRN", "MID", "Merchant", "Currency", "Responsecode"};
        //GT Ghana line 
        String[] columns = {"SN", "Firstname", "Lastname", "Sex", "Attendance", "Date"}; 

        String reportTitle = "Attendance Report";
        List<Map<String, Object>> getTableFields = report.getRecords(sql, columns.length, placeHolders);
// System.out.println("getTableFields"+getTableFields);

        List<String> getColumnNames = Arrays.asList(columns);

        String filepath = null;
        String filepath2 = null;
        String filename = null;
        if (!getTableFields.isEmpty()) {
            switch (reportType) {
                case "pdf":
                    filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "pdf");
                    openPdf(response, request, filepath);
                    break;
                case "csv":
                    filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "csv");
                    openCsv(response, request, filepath);
                    break;
                case "zip":
                    try {
                        filepath = getGenerateReport(getTableFields, getColumnNames, reportTitle, "pdf");

                        filepath2 = getGenerateReport(getTableFields, getColumnNames, reportTitle, "csv");

                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                    String location = getPathToFile("zip");
                    filename = "service charge" + today + ".zip";
                    final int BUFFER = 2048;
                    try {
                        BufferedInputStream origin = null;
                        FileOutputStream dest = new FileOutputStream(location);
                        ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(dest));
                        byte data[] = new byte[BUFFER];

                        String files[] = {filepath, filepath2};
                        for (String filee : files) {
                            FileInputStream fi = new FileInputStream(filee);
                            origin = new BufferedInputStream(fi, BUFFER);
                            ZipEntry entry = new ZipEntry(filee);
                            out.putNextEntry(entry);
                            int count;
                            while ((count = origin.read(data, 0, BUFFER)) != -1) {
                                out.write(data, 0, count);
                            }
                            origin.close();
                        }
                        out.close();

                    } catch (IOException e) {
                        System.out.println("error:" + e.getMessage());
                    }

                    openZip(response, request, location);
                    break;
                default:
                    break;
            }
        } else {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();

            response.sendRedirect("/downloaderror");

            pw.close();
        }

    }
    
             
             
             
             
             
             
             
             
    
    
    
    
    
    
        // This method is responsible for opening the zip file on the browser using httpservlet response
    void openZip(HttpServletResponse response, HttpServletRequest request, String filepath) throws FileNotFoundException, IOException {
        File file = new File(filepath);
        System.out.println("fff:" + file.getName());

        response.setContentType("application/zip");
        response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
        BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(file));
        BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());

        byte[] buffer = new byte[8096];
        int bytesRead = 0;
        while ((bytesRead = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        outStream.flush();
        inStream.close();
    }
    
    
    
    
        // This method is responsible for opening the Csv file on the browser using httpservlet response
    void openCsv(HttpServletResponse response, HttpServletRequest request, String filepath) throws FileNotFoundException, IOException {
        File file = new File(filepath);
        System.out.println("fff:" + file.getName());

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
        BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(file));
        BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());
        byte[] buffer = new byte[8096];
        int bytesRead = 0;
        while ((bytesRead = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        outStream.flush();
        inStream.close();
    }
    
    
    
    
    
    
    
        // This method is responsible for opening the pdf file on the browser using httpservlet response
    void openPdf(HttpServletResponse response, HttpServletRequest request, String filepath) throws FileNotFoundException, IOException {
        File file = new File(filepath);
        System.out.println("fff:" + file.getName());

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
        BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(file));
        BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());

        byte[] buffer = new byte[8096];
        int bytesRead = 0;
        while ((bytesRead = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        outStream.flush();
        inStream.close();

    }
    
    
    
        //This method creates a location where the generated file is saved
    public static String getPathToFile(String type) {

        String filename;
        StringBuilder sb = new StringBuilder();
        java.util.Date today = Calendar.getInstance().getTime();
        String appPath = servletContext.getRealPath("/");
        System.out.println("appPath:" + appPath);
        appPath = appPath.replace('\\', '/');
        String ServerDir = "";
        if (appPath.endsWith("/")) {
            ServerDir = appPath + SAVE_DIRECTORY;
        } else {
            ServerDir = (appPath + "/" + SAVE_DIRECTORY).trim();
        }

        File fileSaveDir = new File(ServerDir);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        if (type.equalsIgnoreCase("pdf")) {
            filename = sb.append(ServerDir).append("/").append("SMS").append(sdf1.format(today)).append(".pdf").toString();
        } else if ((type.equalsIgnoreCase("csv"))) {
            filename = sb.append(ServerDir).append("/").append("SMS").append(sdf1.format(today)).append(".csv").toString();
        } else {
            filename = sb.append(ServerDir).append("/").append("SMS").append(sdf1.format(today)).append(".zip").toString();
        }
        return filename;
    }
    
    
   // This method builds the PDF file
    private static String getPdf(List<Map<String, Object>> list, List<String> headings, String reportTitle, String file) throws FileNotFoundException, MalformedURLException, IOException {
        String path = file;

        com.itextpdf.text.Document my_pdf_report = new com.itextpdf.text.Document(PageSize.A4.rotate());
        my_pdf_report.setMargins(20, 20, 20, 20);
        // Create a PdfFont
        try {
            PdfWriter.getInstance(my_pdf_report, new FileOutputStream(path));
            my_pdf_report.open();

            //Set font variations
            Font largeBold = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
            Font headingFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

            //Add and align image
            String imgpath = servletContext.getRealPath("/") + ("resources/imgs/image2.jpg");
//          System.out.println("ppa:" + imgpath);
            Image img = Image.getInstance(imgpath);
            img.setAlignment(Element.ALIGN_CENTER);
            my_pdf_report.add(img);

            //Add and align Title
            Paragraph title = new Paragraph(reportTitle, largeBold);
            title.setAlignment(Element.ALIGN_CENTER);
            my_pdf_report.add(title);
            my_pdf_report.add(new Paragraph("\n"));

            //Set Date generated
            String dateGenerated = "Report generated on:" + date;
            Paragraph dateGen = new Paragraph(dateGenerated, headingFont);
            dateGen.setAlignment(Element.ALIGN_CENTER);
            my_pdf_report.add(dateGen);
            my_pdf_report.add(new Paragraph("\n"));

            //set the number of table headers
            PdfPTable my_report_table = new PdfPTable(headings.size());

            //create a cell object
            PdfPCell table_cell;

            //add headers
            for (String str : headings) {
                String field = str;
                table_cell = new PdfPCell(new Phrase(field, FontFactory.getFont(FontFactory.TIMES_BOLD)));
                my_report_table.addCell(table_cell);
            }

            // write table row data
            for (Map<String, Object> row : list) {
                for (String str : headings) {
//                    System.out.println("heading:" + str);

                    if (row.get(str.trim()) != null) {
                        my_report_table.addCell((row.get(str.trim()).toString()));
                        // System.out.println("headings[" + row.get(str.trim()).toString() + "]");
                    } else {
                        my_report_table.addCell((""));
                        //System.out.println("headings[]");
                    }
                }
            }

            //Attach report table to PDF /
            my_pdf_report.add(my_report_table);
            my_pdf_report.close();
        } catch (DocumentException ex) {

        }
        return path;
    }

    //This method builds the CSV file
    private static String getCsv(List<Map<String, Object>> list, List<String> headings, String reportTitle, String file) throws IOException {
        String path = file;
        String array[] = new String[headings.size()];
        try (CSVWriter writer = new CSVWriter(new FileWriter(path))) {
            for (int i = 0; i < headings.size(); i++) {
                array[i] = headings.get(i);
            }
            writer.writeNext(array);
            // write table row data
            for (Map<String, Object> row : list) {
                String array2[] = new String[headings.size()];
                for (int i = 0; i < headings.size(); i++) {
                    if (row.get(headings.get(i).trim()) != null) {
                        array2[i] = String.valueOf(row.get(headings.get(i).trim()));
//                        System.out.println("headings[" + row.get(headings.get(i).trim()).toString() + "]");
                    } else {
                        array2[i] = String.valueOf("");
                        System.out.println("headings[]");
                    }
                }
                writer.writeNext(array2);
            }
        }
        return path;
    }

    // This method is responsible for generating the reports in pdf or csv
    public static String getGenerateReport(List<Map<String, Object>> list, List<String> headings, String reportTitle, String type) throws FileNotFoundException, IOException {
        String FilePath = "";
        if (type.trim().equalsIgnoreCase("pdf")) {
            FilePath = getPathToFile(type.trim());
            getPdf(list, headings, reportTitle, FilePath);
        } else {
            FilePath = getPathToFile(type.trim());
            getCsv(list, headings, reportTitle, FilePath);
        }

        return FilePath;
    }
    
    
    
    @RequestMapping(value = "/downloaderror", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView downloaderror(HttpServletRequest request, @RequestParam(defaultValue = "1") int page_num) {
        ModelAndView model = new ModelAndView();

        model.setViewName("downloaderror");
        return model;
    }
    
    
    
}
