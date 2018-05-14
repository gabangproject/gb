package com.sist.controller;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//  ������   @������̼Ǹ�
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
// RUNTIME , SOURCE , CLASS : ���� �Ⱓ 
@Target(ElementType.TYPE)
public @interface Controller {

}






