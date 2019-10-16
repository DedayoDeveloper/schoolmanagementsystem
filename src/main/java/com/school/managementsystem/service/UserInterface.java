/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.User;
import java.util.List;

/**
 *
 * @author oreoluwa
 */
public interface UserInterface {
    
       public String getUserRoles(String username);
       public List<User> getUserByRole(String userrole);
       public String SelectUsertypeName(String username);
}
