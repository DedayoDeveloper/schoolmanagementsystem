/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.util;

/**
 *
 * @author oreoluwa
 */
public class Pagination {
    
    
     private int total_num_rows;
    private int page_num;
    public int page_row = 10;
    public String link = "";
    public String paginate = "";

    public Pagination(int page_num, int tot_num_rows) {
        this.total_num_rows = tot_num_rows;
        this.page_num = page_num;
    }
    public Pagination(int page_num, int tot_num_rows, int page_row) {
        this(page_num, tot_num_rows);
        this.page_row = page_row;
    }
    public String setLink(String link) {
        this.link = link;
        return link;
    }

    public String getLimit() {

        int last = (int) Math.ceil((double) this.total_num_rows / (double) this.page_row);
        if (last < 1) {
            last = 1;
        }
        if (this.page_num < 1) {
            this.page_num = 1;
        } else if (this.page_num > last) {
            this.page_num = last;
        }
        int myLimit = (this.page_num - 1) * this.page_row;
        String limit = "LIMIT " + myLimit + ", " + this.page_row;

        return limit;
    }

    public String getControls() {
        String centerLeft = "",
                nextBtn = "",
                previousBtn = "",
                centerRight = "",
                center = "",
                open = "",
                close = "";
        double last = Math.ceil((double) this.total_num_rows / (double) this.page_row);
        if (last < 1) {
            last = 1;
        }
        if (last != 1) {
            open = "<nav aria-label=\"\"><ul class=\"pagination justify-content-center\">";
            close = "</ul></nav>";

            if (this.page_num > 1) {
                int previous = this.page_num - 1;
                previousBtn = "<li class=\"page-item\"><a class=\"page-link link\" href=" + (this.link + previous) + ">PREVIOUS</a></li>";

                for (int i = this.page_num - 4; i < this.page_num; i++) {
                    if (i > 0) {
                        centerLeft += "<li class=\"page-item\"><a class=\"page-link link\" href=\"" + (this.link + i) + "\">" + i + "</a></li>";
                    }
                }
            } else {
                center = "<li class=\"page-item active\"><a class=\"page-link link\" href=\"#\" onclick=\"return false;\">" + this.page_num + "</a></li>";
                previousBtn = "<li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\" tabindex=\"-1\">PREVIOUS</a></li>";
            }
            center = "<li class=\"page-item active\"><a class=\"page-link link\" href=\"#\" onclick=\"return false;\">" + this.page_num + "</a></li>";
            for (int i = this.page_num + 1; i <= last; i++) {
                centerRight += "<li class=\"page-item\"><a class=\"page-link link\" href=\"" + (this.link + i) + "\">" + i + "</a></li>";
                if (i > (this.page_num + 4)) {
                    break;
                }
            }
            if (this.page_num != last) {
                int next = this.page_num + 1;
                nextBtn = "<li class=\"page-item\"><a class=\"page-link link\" href=" + (this.link + next) + ">NEXT</a></li>";
            } else {
                nextBtn = "<li class=\"page-item disabled\"><a class=\"page-link link\" href=\"#\" onclick=\"return false;\" tabindex=+1>NEXT</a></li>";
            }
        }
        return open + previousBtn + centerLeft + center + centerRight + nextBtn + close;
    }

    
    
    
    
    
}
