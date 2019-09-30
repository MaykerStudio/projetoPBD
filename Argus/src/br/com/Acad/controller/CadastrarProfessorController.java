package br.com.Acad.controller;

import java.net.URL;
import java.sql.Date;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXCheckBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXTextField;

import br.com.Acad.dao.DaoContatos;
import br.com.Acad.dao.DaoEndereco;
import br.com.Acad.dao.DaoPessoa;
import br.com.Acad.dao.DaoProfessor;
import br.com.Acad.model.Contato;
import br.com.Acad.model.Endereco;
import br.com.Acad.model.Pessoa;
import br.com.Acad.model.Professor;
import br.com.Acad.util.AutoCompleteComboBoxListener;
import br.com.Acad.util.SysLog;
import br.com.Acad.util.TextFieldFormatter;
import br.com.Acad.util.Util;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.input.KeyEvent;

public class CadastrarProfessorController implements Initializable{

    @FXML
    private JFXTextField nome;

    @FXML
    private JFXDatePicker dt_nascimento;

    @FXML
    private JFXTextField naturalidade;

    @FXML
    private JFXTextField cpf;

    @FXML
    private JFXTextField nomeRua;

    @FXML
    private JFXTextField numero;

    @FXML
    private JFXTextField complemento;

    @FXML
    private JFXTextField bairro;

    @FXML
    private ComboBox<String> estado;

    @FXML
    private ComboBox<String> cidade;

    @FXML
    private JFXTextField email;

    @FXML
    private JFXTextField telefone;

    @FXML
    private JFXTextField celular;

    @FXML
    private JFXCheckBox whatsapp;

    @FXML
    private JFXTextField cursoFormacao;

    @FXML
    private ComboBox<String> formacao;

    @FXML
    private JFXButton btn_confirmar;

    private DaoPessoa daoPessoas;

    private DaoEndereco daoEnderecos;

    private DaoContatos daoContatos;

    private DaoProfessor daoProfessor;

    private ObservableList<Pessoa> oblist_pessoas = FXCollections.observableArrayList();

    @FXML
    void confirmar(ActionEvent event) {
    	if(checkTextFields()){

    		oblist_pessoas = daoPessoas.getAllPessoa();
    		for (int i = 0; i < oblist_pessoas.size(); i++) {
    			String obCPF = oblist_pessoas.get(i).getCpf();

				if(obCPF != null && obCPF.equals(cpf.getText())){
					Util.Alert("CPF j� est� cadastrado no sistema!");
					return;
				}
			}

    		try {

    			Pessoa p = new Pessoa();
        		Endereco e = new Endereco();
        		Professor pr = new Professor();
        		Contato c = new Contato();

        		p.setNome(nome.getText());
        		p.setCpf(cpf.getText());
        		Date date = Date.valueOf(dt_nascimento.getValue());
        		p.setDt_nascimento(date);
        		p.setNaturalidade(naturalidade.getText());
        		p.setStatus("Ativo");

        		int cod = daoPessoas.addPessoa(p);
        		SysLog.addLog(SysLog.createPessoas(cod));

        		e.setCodPessoa(cod);
        		e.setBairro(bairro.getText());
        		e.setCidade(cidade.getSelectionModel().getSelectedItem());
        		e.setEstado(estado.getSelectionModel().getSelectedItem());
        		e.setNumero(Integer.valueOf(numero.getText().replaceAll("\\s+", "")));
        		e.setRua(nomeRua.getText());
        		if(complemento.getText() != null && complemento.getText().length() > 0)e.setComplemento(complemento.getText());

        		daoEnderecos.addEndereco(e);
        		SysLog.addLog(SysLog.createDados("Endere�o", cod));

        		c.setCodPessoa(cod);
        		if(email.getText().length() > 0)c.setEmail(email.getText());
    			if(telefone.getText().length() > 0)c.setTelefone(telefone.getText());
    			if(celular.getText().length() > 0)c.setCelular(celular.getText());
    			if(whatsapp.isSelected()){
    				c.setWhatsapp(1);
    			}
    			else{
    				c.setWhatsapp(0);
    			}

    			if(email.getText().length() > 0 || telefone.getText().length() > 0 || celular.getText().length() > 0){
    				daoContatos.addContato(c);
    				SysLog.addLog(SysLog.createDados("Contato", cod));
    			}

    			pr.setCodPessoa(cod);
    			pr.setNome(nome.getText());
    			pr.setCpf(p.getCpf());
    			pr.setCursoFormacao(cursoFormacao.getText());
    			pr.setFormacao(formacao.getSelectionModel().getSelectedItem());
    			daoProfessor.addProfessor(pr);
    			SysLog.addLog(SysLog.createTipoPessoa("Professor", cod));

        	    SysLog.complete();


			} catch (Exception e) {
				Util.Alert("Erro ao concluir o cadastro!\nContate o administrador!");
				e.printStackTrace();
			}

    	}
    }

    @FXML
    void formatNumeroTxt(KeyEvent event) {
    	TextFieldFormatter tff = new TextFieldFormatter();
		tff.setMask("#####");
		tff.setCaracteresValidos("0123456789");
		tff.setTf(numero);
		tff.formatter();
    }

    @FXML
    void limpar(ActionEvent event) {
    	nome.clear();cpf.clear();
		dt_nascimento.setValue(null);naturalidade.clear();
		nomeRua.clear();complemento.clear();numero.clear();
		whatsapp.setSelected(false);cidade.getSelectionModel().clearSelection();cidade.getEditor().clear();
		formacao.getSelectionModel().clearSelection();formacao.getEditor().clear();
		estado.getSelectionModel().clearSelection();estado.getEditor().clear();bairro.clear();
		cursoFormacao.clear();
    }

    void populateBoxes(){
    	estado.getItems().addAll("Acre","Alagoas","Amap�","Amazonas","Bahia","Cear�","Distrito Federal",
				"Esp�rito Santo","Goi�s","Maranh�o","Mato Grosso","Mato Grosso do Sul","Minas Gerais","Par�","Para�ba",
				"Paran�","Pernambuco","Piau�","Rio de Janeiro",
				"Rio Grande do Norte","Rio Grande do Sul","Rond�nia",
				"Roraima","Santa Catarina","S�o Paulo","Sergipe","Tocantins");

    	formacao.getItems().addAll("Licenciatura", "Normal Superior", "Magist�rio", "Pedagogia", "Bacharelado");
		new AutoCompleteComboBoxListener<>(estado);
		new AutoCompleteComboBoxListener<>(cidade);
		new AutoCompleteComboBoxListener<>(formacao);
    }

    @FXML
    void populateCidades(ActionEvent event) {
    	Util.populateCidade(estado, cidade);
    }

    boolean checkTextFields(){

    	TextFieldFormatter tff = new TextFieldFormatter();

    	if(nome.getText().length() == 0 || nome.getText() == null){
    		Util.Alert("Verifique o nome!");
    		return false;
    	}

    	if(cpf.getText().length() < 11 || (cpf.getText().length() > 11 && cpf.getText().length() < 14)){
    		Util.Alert("Verifique o CPF!");
    		return false;
    	}else{
    		tff = new TextFieldFormatter();
    		tff.setMask("###.###.###-##");
    		tff.setCaracteresValidos("0123456789");
    		tff.setTf(cpf);
    		tff.formatter();
    	}

    	if(naturalidade.getText().length() < 5 || naturalidade.getText() == null){
    		Util.Alert("Verifique a naturalidade!");
    		return false;
    	}

    	if(dt_nascimento.getValue() == null){
    		Util.Alert("Verifique a Data de nascimento!");
    		return false;
    	}

    	if(nomeRua.getText().length() < 5){
    		Util.Alert("Verifique o nome da rua!");
    		return false;
    	}

    	if(numero.getText().length() < 1){
    		Util.Alert("Digite o n�mero da resid�ncia!");
    		return false;
    	}

    	if(bairro.getText().length() < 1){
    		Util.Alert("Digite o nome do bairro!");
    		return false;
    	}

    	if(estado.getSelectionModel().getSelectedItem() == null || cidade.getSelectionModel().getSelectedItem() == null){
    		Util.Alert("Selecione cidade e estado!");
    		return false;
    	}

    	if(email.getText().length() > 0){
    		if(!Util.validarEmail(email.getText())){
    			Util.Alert("Verifique o email.\nPs: Email n�o � obrigat�rio no cadastro!");
    			return false;
    		}
    	}


    	if(celular.getText().length() > 0){
    		if(celular.getText().length() < 11 || (celular.getText().length() > 11 && celular.getText().length() < 14)){
    			Util.Alert("Verifique o n�mero de celular.\nPs: celular n�o � obrigat�rio no cadastro!");
    			return false;
    		}else{
    			tff.setMask("(##)#####-####");
    			tff.setCaracteresValidos("0123456789");
    			tff.setTf(celular);
    			tff.formatter();
    		}
    	}

    	if(telefone.getText().length() > 0){
    		if(telefone.getText().length() < 10 || (telefone.getText().length() > 10 && telefone.getText().length() < 13)){
    			Util.Alert("Verifique o n�mero de telefone.\nPs: telefone n�o � obrigat�rio no cadastro!");
    			return false;
    		}else{
    			tff.setMask("(##)####-####");
    			tff.setCaracteresValidos("0123456789");
    			tff.setTf(telefone);
    			tff.formatter();
    		}
    	}



    	return true;

	}

    void initValidation(){
    	Util.requiredFieldSet(nome, naturalidade, cpf, nomeRua, numero, cursoFormacao);

    }

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		populateBoxes();
		initValidation();

		daoPessoas = new DaoPessoa();
		daoEnderecos = new DaoEndereco();
		daoContatos = new DaoContatos();
		daoProfessor = new DaoProfessor();

	}

}