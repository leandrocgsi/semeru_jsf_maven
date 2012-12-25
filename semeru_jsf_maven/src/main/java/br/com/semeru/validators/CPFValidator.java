package br.com.semeru.validators;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator("cpfValidator")
public class CPFValidator implements Validator {
    @Override
    public void validate(FacesContext ctx, UIComponent cmpt,Object valor) throws ValidatorException {
        if (!validaCPF(String.valueOf(valor))) {
            FacesMessage message = new FacesMessage();
            message.setDetail("Por favor digite um CPF válido!");
            message.setSummary("Por favor digite um CPF válido!");
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(message);
        }
    }
      
    private static boolean validaCPF(String cpf) {
        //remove pontos e tracos
        cpf = cpf.replaceAll("\\.", "");
        cpf = cpf.replaceAll("-", "");
        
        if (cpf == null || cpf.length() != 11 || isCPFPadrao(cpf))
            return false;
        try {
            Long.parseLong(cpf);
        } catch (NumberFormatException e) {
            // CPF não possui somente números
            return false;
        }
        if (!calcDigVerif(cpf.substring(0, 9)).
            equals(cpf.substring(9, 11))) {
            return false;
        }
        return true;
    }

    private static boolean isCPFPadrao(String cpf) {
        if (   cpf.equals("00000000000")||cpf.equals("11111111111")
            || cpf.equals("22222222222")|| cpf.equals("33333333333")
            || cpf.equals("44444444444")|| cpf.equals("55555555555")
            || cpf.equals("66666666666")|| cpf.equals("77777777777")
            || cpf.equals("88888888888")|| cpf.equals("99999999999"))
        {
            return true;
        }
            return false;
    }
    
    private static String calcDigVerif(String num) {
        
        Integer primDig, segDig;
        int soma = 0, peso = 10;
        
        for (int i = 0; i < num.length(); i++)
            soma += Integer.parseInt(num.substring(i, i + 1)) * peso--;
        if (soma % 11 == 0 | soma % 11 == 1)
            primDig = new Integer(0);
        else
            primDig = new Integer(11 - (soma % 11));
        
        soma = 0;
        peso = 11;
        
        for (int i = 0; i < num.length(); i++)
            soma += Integer.parseInt(num.substring(i, i + 1)) * peso--;
            soma += primDig.intValue() * 2;
        if (soma % 11 == 0 | soma % 11 == 1)
            segDig = new Integer(0);
        else
            segDig = new Integer(11 - (soma % 11));
        
        return primDig.toString() + segDig.toString();
    }
}
