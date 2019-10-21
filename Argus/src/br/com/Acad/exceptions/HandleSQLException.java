package br.com.Acad.exceptions;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLSyntaxErrorException;

import org.hibernate.exception.ExceptionUtils;

import br.com.Acad.util.Util;
import javafx.application.Platform;

public class HandleSQLException {

	public HandleSQLException(Throwable e){
		handle(e);
	}

	private void handle(Throwable e){
		Throwable[] t = ExceptionUtils.getThrowables(e);
		for (int i = 0; i < t.length; i++) {
			Throwable throwable = t[i];
			if(throwable instanceof SQLSyntaxErrorException){
				if(((SQLSyntaxErrorException) throwable).getErrorCode() == 1142){
					Platform.runLater(new Runnable() {
						@Override
						public void run() {
							Util.Alert("Acesso negado!\nContate o administrador");
							return;
						}
					});
				}else{
					Platform.runLater(new Runnable() {
						@Override
						public void run() {
							Util.Alert("Ocorreu um erro!\nContate o administrador");
							return;
						}
					});
					printExeception(e);
				}
			}
			else if(throwable instanceof SQLIntegrityConstraintViolationException){
				if(((SQLIntegrityConstraintViolationException) throwable).getErrorCode() == 1062){
					Util.Alert("O registro j� est� no sistema!");
					return;
				}else{
					Platform.runLater(new Runnable() {
						@Override
						public void run() {
							Util.Alert("Acesso negado!\nContate o administrador");
							return;
						}
					});
					printExeception(e);
				}
			}
			else{
				if(i == t.length-1){
					printExeception(throwable);
				}
			}
			printExeception(e);
		}
	}

	private void printExeception(Throwable e){
		e.printStackTrace();
		FileWriter fw = null;
		try {
			fw = new FileWriter("execp.txt", true);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		PrintWriter pw = new PrintWriter (fw);
        e.printStackTrace (pw);
	}

}
