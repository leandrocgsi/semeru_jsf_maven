package br.com.semeru.conversores;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@FacesConverter(value = "converterSHA1")
public class ConverterSHA1 implements Converter{

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        return cipher(value);
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        return value.toString();
    }

    public static String cipher(String value) {
        String algorithm = "SHA1";
        byte[] buffer = value.getBytes();
        MessageDigest md;
        try {
            md = MessageDigest.getInstance(algorithm);
            md.update(buffer);
            byte[] digest = md.digest();
            String hexValue = "";
            for (int i = 0; i < digest.length; i++) {
                int b = digest[i] & 0xff;
                if (Integer.toHexString(b).length() == 1) {
                    hexValue = hexValue + "0";
                }
                hexValue = hexValue + Integer.toHexString(b);
            }
            return hexValue;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ConverterSHA1.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
