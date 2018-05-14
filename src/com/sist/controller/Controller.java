package com.sist.controller;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//  구분자   @어노테이션명
/*    @ => TYPE
 *    public class clsName{
 *      @ => FIELD
 *      private String name;
 *      
 *      @ => CONSTRUCT
 *      public clsName()
 *      {
 *      }
 *      
 *      @ => METHOD
 *      public void display()
 *      {
 *      }
 *      public void setName(@PARAMETER String name)
 *      {
 *      }
 *    }
 */
@Retention(RetentionPolicy.RUNTIME)
// RUNTIME , SOURCE , CLASS : 저장 기간 
@Target(ElementType.TYPE)
public @interface Controller {

}






