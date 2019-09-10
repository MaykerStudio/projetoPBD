package br.com.Acad.controller;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.persistence.Persistence;

import org.apache.commons.codec.digest.DigestUtils;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;

import br.com.Acad.app.Main;
import br.com.Acad.dao.DaoMudarSenhas;
import br.com.Acad.dao.DaoUsuarios;
import br.com.Acad.exceptions.ExceptionUtil;
import br.com.Acad.model.MudarSenha;
import br.com.Acad.model.Usuario;
import br.com.Acad.sql.FillDataBase;
import br.com.Acad.util.TextFieldFormatter;
import br.com.Acad.util.Util;
import javafx.animation.FadeTransition;
import javafx.application.Platform;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Rectangle2D;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Screen;
import javafx.util.Duration;

public class LoginController implements Initializable{
	
	@FXML
    private AnchorPane loginPane;
	
	@FXML
    private ImageView background;

    @FXML
    private JFXTextField txt_login;

    @FXML
    private JFXPasswordField txt_senha;

    @FXML
    private JFXButton btn_confirmar;

    @FXML
    private Label label_error;
    
    @FXML
    private Label label_error2;
    
    @FXML
    private HBox top;
    
    @FXML
    private VBox box_login;
    
    @FXML
    private VBox Box_recovery;
    
    @FXML
    private JFXTextField CPF;

    @FXML
    private JFXPasswordField novaSenha;

    @FXML
    private JFXPasswordField confirmarSenha;

    @FXML
    private JFXButton solicitarAut;
    
    private DaoUsuarios daoUsuarios;
    
    private DaoMudarSenhas daoMudarSenhas;
    
    private MainTelaController mainTela;

    @FXML
    void close_app(MouseEvent event) {
    	Platform.exit();
    }

    @FXML
    void handle_login(ActionEvent event) throws ExceptionUtil, IOException {
    	
    	if(txt_senha.getText().length() > 0 && txt_login.getText().length() > 0){
    		String hash = DigestUtils.sha1Hex(txt_senha.getText());
        	Usuario check = daoUsuarios.getUsuario(txt_login.getText(), hash);
        	label_error.setVisible(false);
        	
        	if(check != null){		
        		
        		Util.contentPane.getChildren().remove(loginPane);
       		
          		mainTela.enableDrawer();
    			mainTela.setUser(check);		
    			mainTela.enableHamburger();
    			mainTela.enableNotificationTask();	
    			
    			
        	}
        	
        	else{
        		label_error.setVisible(true);
        		FadeTransition fadeTransition = new FadeTransition(Duration.seconds(0.1), label_error);
        		fadeTransition.setFromValue(0.0);
        		fadeTransition.setToValue(1.0);
        		fadeTransition.setCycleCount(8);	
        		fadeTransition.play();
        	}
    	}
  
    }

    @FXML
    void handle_loginEnter(KeyEvent event) throws ExceptionUtil, IOException {
    	
    	if(event.getCode().toString().equals("ENTER")){
    		if(txt_senha.getText().length() > 0 && txt_login.getText().length() > 0){
        		String hash = DigestUtils.sha1Hex(txt_senha.getText());
            	Usuario check = daoUsuarios.getUsuario(txt_login.getText(), hash);
            	label_error.setVisible(false);
            	
            	if(check != null){	 
            		
            		Util.contentPane.getChildren().remove(loginPane);
            		
            		mainTela.enableDrawer();
            		mainTela.setUser(check);
        			mainTela.enableHamburger();
        			mainTela.enableNotificationTask();		
  			   		    		
            	} 	
            	else{
            		label_error.setVisible(true);
            		FadeTransition fadeTransition = new FadeTransition(Duration.seconds(0.1), label_error);
            		fadeTransition.setFromValue(0.0);
            		fadeTransition.setToValue(1.0);
            		fadeTransition.setCycleCount(8);	
            		fadeTransition.play();
            	}
        	}
    	}
    	
    }

    @FXML
    void handle_request(ActionEvent event) throws ExceptionUtil {
    	
    	if(CPF.getText().length() == 11 && novaSenha.getText().length() >= 6 && novaSenha.getText().equals(confirmarSenha.getText())){
    		TextFieldFormatter tff = new TextFieldFormatter();
    		tff = new TextFieldFormatter();
			tff.setMask("###.###.###-##");
			tff.setCaracteresValidos("0123456789");
			tff.setTf(CPF);
			tff.formatter();
			
			Usuario user = daoUsuarios.getUsuario(CPF.getText());
			if(user == null){
				label_error2.setVisible(true);
        		FadeTransition fadeTransition = new FadeTransition(Duration.seconds(0.1), label_error2);
        		fadeTransition.setFromValue(0.0);
        		fadeTransition.setToValue(1.0);
        		fadeTransition.setCycleCount(8);	
        		fadeTransition.play();
        		
        		return;
			}
			
			MudarSenha mudarSenha = new MudarSenha();
			mudarSenha.setCpf(CPF.getText());
			
			String hash = DigestUtils.sha1Hex(novaSenha.getText());
			mudarSenha.setSenha(hash);
	
			daoMudarSenhas.addRequest(mudarSenha);				
    		
    		Util.Alert("Solicita��o enviada!\nAguarde um administrador confirmar.");
    		mudarSenhaMenu(event);
    		CPF.clear();novaSenha.clear();confirmarSenha.clear();
    	}else{
    		Util.Alert("Verifique os campos e tente novamente!");
    	}
    }
    
    @FXML
    void minimize_stage(MouseEvent event) {
    	Main.stage.setIconified(true);
    }
    
    void setMainTela(MainTelaController m){
    	this.mainTela = m;
    }
    
    @FXML
    void mudarSenhaMenu(ActionEvent event) {
    	if(box_login.isVisible()){
    		box_login.setVisible(false);
    	}
    	else{
    		box_login.setVisible(true);
    	}
    	if(Box_recovery.isVisible()){
    		Box_recovery.setVisible(false);
    	}else{
    		Box_recovery.setVisible(true);
    	}
    	
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) {
	
		Rectangle2D screenBounds = Screen.getPrimary().getBounds();
		
		background.setImage(new Image("/images/argus_logo2.png"));
		
		background.setFitWidth(screenBounds.getWidth());
		background.setFitHeight(screenBounds.getHeight());
		

		FillDataBase db = new FillDataBase();
		
		try {
			db.checkDB();
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		
		Main.factory = Persistence.createEntityManagerFactory("argusDB");
		Main.entityManager = Main.factory.createEntityManager();
		
		daoUsuarios = new DaoUsuarios(Main.entityManager);
		daoMudarSenhas = new DaoMudarSenhas(Main.entityManager);
		
		
		txt_senha.textProperty().addListener(
		     (observable, old_value, new_value) -> {
		    	 
		          if(new_value.contains(" ")){
		                //prevents from the new space char
		        	  txt_senha.setText(old_value); 
		          }
		          if(new_value.length() > 11){
		        	  txt_senha.setText(old_value);
		          }
		          
		     }
		);
		
		novaSenha.textProperty().addListener(
			     (observable, old_value, new_value) -> {
			    	 
			          if(new_value.contains(" ")){
			                //prevents from the new space char
			        	  novaSenha.setText(old_value); 
			          }
			          if(new_value.length() > 11){
			        	  novaSenha.setText(old_value);
			          }
			          
			     }
			);
		
		confirmarSenha.textProperty().addListener(
			     (observable, old_value, new_value) -> {
			    	 
			          if(new_value.contains(" ")){
			                //prevents from the new space char
			        	  confirmarSenha.setText(old_value); 
			          }
			          if(new_value.length() > 11){
			        	  confirmarSenha.setText(old_value);
			          }
			          
			     }
			);
		
	}

}