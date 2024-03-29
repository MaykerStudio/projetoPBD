package br.com.Acad.controller;

import java.net.URL;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;

import org.apache.commons.codec.digest.DigestUtils;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXCheckBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTabPane;
import com.jfoenix.controls.JFXTextField;

import br.com.Acad.app.Main;
import br.com.Acad.model.Contato;
import br.com.Acad.model.Endereco;
import br.com.Acad.model.Pessoa;
import br.com.Acad.model.Usuario;
import br.com.Acad.sql.ConnectionClass;
import br.com.Acad.util.AutoCompleteComboBoxListener;
import br.com.Acad.util.TextFieldFormatter;
import br.com.Acad.util.Util;
import br.com.Acad.util.UtilDao;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DialogPane;
import javafx.scene.control.Label;
import javafx.scene.control.SingleSelectionModel;
import javafx.scene.control.Tab;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.effect.BoxBlur;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;

public class PessoasManagerController implements Initializable{

	@FXML
	private JFXTextField nome_update;

	@FXML
	private JFXDatePicker dt_nascimento_update;

	@FXML
	private JFXTextField naturalidade_update;

	@FXML
	private JFXTextField cpf_update;

	@FXML
	private JFXTextField nomeRua_update;@FXML
	private JFXTextField nomeRua_listar;

	@FXML
	private JFXTextField numero_update;@FXML
	private JFXTextField numero_listar;

	@FXML
	private JFXTextField complemento_update;@FXML
	private JFXTextField complemento_listar;

	@FXML
	private JFXTextField bairro_update;@FXML
	private JFXTextField bairro_listar;

	@FXML
	private ComboBox<String> cidade_update;@FXML
	private JFXTextField cidade_listar;


	@FXML
	private ComboBox<String> estado_update;@FXML
	private JFXTextField estado_listar;

	@FXML
	private JFXTextField email_update;@FXML
	private JFXTextField email_listar;

	@FXML
	private JFXTextField telefone_update;@FXML
	private JFXTextField telefone_listar;

	@FXML
	private JFXTextField celular_update;@FXML
	private JFXTextField celular_listar;

	@FXML
	private JFXTextField campo_pesquisa; @FXML
	private JFXTextField campo_pesquisa2;


	@FXML
	private JFXCheckBox whatsapp_update;@FXML
	private JFXCheckBox whatsapp_listar;

	@FXML
	private Tab atualizarTab;

	@FXML
	private Tab listarTab;

	@FXML
	private Tab desativarTab;

	@FXML
	private JFXTabPane tabPane;

	//Tables

	@FXML
	private TableView<Pessoa> table_pessoas;

	@FXML
	private TableColumn<Pessoa, String> col_codPessoa;

	@FXML
	private TableColumn<Pessoa, String> col_nome;

	@FXML
	private TableColumn<Pessoa, String> col_cpf;

	@FXML
	private TableColumn<Pessoa, Date> col_dt_nascimento;

	@FXML
	private TableColumn<Pessoa, String> col_naturalidade;

	@FXML
	private TableColumn<Pessoa, String> col_status;

	@FXML
	private TableView<Pessoa> table_pessoas2;

	@FXML
	private TableColumn<Pessoa, String> col_codPessoa2;

	@FXML
	private TableColumn<Pessoa, String> col_nome2;

	@FXML
	private TableColumn<Pessoa, String> col_cpf2;

	@FXML
	private TableColumn<Pessoa, Date> col_dt_nascimento2;

	@FXML
	private TableColumn<Pessoa, String> col_naturalidade2;

	@FXML
	private TableColumn<Pessoa, String> col_status2;

	@FXML
	private VBox vbox_atualizar;

	@FXML
	private Label codigo_listar;

	@FXML
	private JFXButton btn_ativar;

	@FXML
	private JFXButton btn_desativar;

	@FXML
	private JFXButton btn_deletar;

	@FXML
	private DialogPane dialogPane;

	@FXML
	private JFXPasswordField ConfirmPassword;

	@FXML
	private JFXButton confirmarDelete;

	@FXML
	private JFXButton btn_cancelarDelete;

	@FXML
	private Label label_delete;

	private FilteredList<Pessoa> filteredData;

	private FilteredList<Pessoa> filteredData2;

	private ObservableList<Pessoa> oblist = FXCollections.observableArrayList();

	private ObservableList<Endereco> oblistEnderecos = FXCollections.observableArrayList();

	private String oldCPF;

	private Pessoa pessoaToEdit;

	@FXML
	void minimize_stage(MouseEvent event) {
		Main.stage.setIconified(true);
	}

	void disableAtualizar(){
		vbox_atualizar.setDisable(true);
	}

	void enableAtualizar(){
		vbox_atualizar.setDisable(false);
	}

	@FXML
	void confirmar_deletarPessoa(ActionEvent event) throws SQLException {
		if(event.getSource() == confirmarDelete){
			if(!ConfirmPassword.getText().isEmpty()){
				String hash = DigestUtils.md5Hex(ConfirmPassword.getText());
				if(hash.equals(MainTelaController.user.getSenha())){

					UtilDao.daoPessoa.deletarPessoa(pessoaToEdit);
					dialogPane.setVisible(false);
					tabPane.setEffect(null);
					tabPane.setMouseTransparent(false);
					initTables();

					Util.Alert(pessoaToEdit.getNome()+" foi removido do sistema!");

		    		Usuario u = UtilDao.daoUsuarios.getUsuario(pessoaToEdit.getCpf());

		    		if(u != null){
		    			Connection con = ConnectionClass.createConnection();
			    		PreparedStatement stmt = con.prepareStatement("DROP USER ?@'localhost';");
			    		stmt.setString(1, u.getUser());
			    		stmt.execute();
			    		stmt.close();
			    		con.close();
		    		}

		    		pessoaToEdit = null;

				}
			}
		}else{
			dialogPane.setVisible(false);
			tabPane.setEffect(null);
			tabPane.setMouseTransparent(false);
		}
	}


	@FXML
	void desativar_ativar_Pessoas(ActionEvent event)  {
		Pessoa selected = table_pessoas2.getSelectionModel().getSelectedItem();
		if(selected != null){
			if(event.getSource() == btn_ativar){
				UtilDao.daoPessoa.ativarPessoa(selected);
			}
			else if(event.getSource() == btn_desativar){
				UtilDao.daoPessoa.desativarPessoa(selected);
			}
			else if(event.getSource() == btn_deletar){
				pessoaToEdit = selected;
				label_delete.setText("Confirme sua senha para deletar a pessoa de Cod: "+selected.getCodPessoa()+" Nome: "+selected.getNome());
				BoxBlur blur = new BoxBlur(3, 3, 3);
				if(!dialogPane.isVisible()){
					dialogPane.setVisible(true);
					tabPane.setEffect(blur);
					tabPane.setMouseTransparent(true);
					Platform.runLater(() -> ConfirmPassword.requestFocus());
				}
			}

			initTables();
		}else{
			Util.Alert("Selecione uma pessoa na tabela!");
		}

	}


	@FXML
	void atualizar(ActionEvent event) throws SQLException, InterruptedException {
		if(checkTextFields()){
			oblist = UtilDao.daoPessoa.getAllPessoa();
			Connection con = ConnectionClass.createConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT cpf FROM argus.pessoas WHERE pessoas.cpf = ?");
			stmt.setString(1, cpf_update.getText());
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				if(!oldCPF.equals(rs.getString(1))){
					Util.Alert("CPF j� est� cadastrado no sistema!");
					return;
				}
			}

			Date date = Date.valueOf(dt_nascimento_update.getValue());
			Pessoa p = table_pessoas.getSelectionModel().getSelectedItem();
			Endereco e = new Endereco();
			Contato c = new Contato();

			p.setNome(nome_update.getText());
			p.setDt_nascimento(date);
			p.setNaturalidade(naturalidade_update.getText());
			p.setStatus("Ativo");
			if(cpf_update.getText().length() > 0)p.setCpf(cpf_update.getText());
			else p.setCpf(null);

			UtilDao.daoPessoa.UpdatePessoa(p);
			int cod = p.getCodPessoa();

			e.setCodPessoa(cod);
			e.setRua(nomeRua_update.getText());
			e.setNumero(Integer.valueOf(numero_update.getText().replaceAll("\\s+", "")));
			if(complemento_update.getText() != null && complemento_update.getText().length() > 0)e.setComplemento(complemento_update.getText());
			e.setBairro(bairro_update.getText());
			e.setEstado(estado_update.getSelectionModel().getSelectedItem());
			e.setCidade(cidade_update.getSelectionModel().getSelectedItem());


			UtilDao.daoEnderecos.UpdateEndereco(e);

			c.setCodPessoa(cod);
			if(email_update.getText().length() > 0)c.setEmail(email_update.getText());
			if(telefone_update.getText().length() > 0)c.setTelefone(telefone_update.getText());
			if(celular_update.getText().length() > 0)c.setCelular(celular_update.getText());
			if(whatsapp_update.isSelected()){
				c.setWhatsapp(1);
			}
			else{
				c.setWhatsapp(0);
			}

			if(email_update.getText().length() > 0 || telefone_update.getText().length() > 0 || celular_update.getText().length() > 0){
				UtilDao.daoContatos.UpdateContato(c);
			}

			Util.Alert("Cod: "+cod+"\nNome: "+p.getNome()+"\nAtualizado com sucesso!");

			initTables();
			limpar(event);

		}
	}

	@FXML
	void selecionarPessoa(ActionEvent event)  {
		Pessoa p = table_pessoas.getSelectionModel().getSelectedItem();
		if(p != null){

			limpar(event);

			codigo_listar.setText(String.valueOf(p.getCodPessoa()));

			Endereco e = UtilDao.daoEnderecos.getEndereco(p.getCodPessoa());
			Contato c = UtilDao.daoContatos.getContato(p.getCodPessoa());

			nome_update.setText(p.getNome());
			naturalidade_update.setText(p.getNaturalidade());
			if(p.getCpf() != null){
				cpf_update.setText(p.getCpf());
				oldCPF = p.getCpf();
			}
			LocalDate dt = p.getDt_nascimento().toLocalDate();
			dt_nascimento_update.setValue(dt);

			nomeRua_update.setText(e.getRua());
			numero_update.setText(String.valueOf(e.getNumero()));
			complemento_update.setText(e.getComplemento());
			bairro_update.setText(e.getBairro());
			estado_update.getSelectionModel().select(e.getEstado());
			cidade_update.getSelectionModel().select(e.getCidade());

			if(c != null){
				if(c.getEmail() != null)email_update.setText(c.getEmail());
				if(c.getTelefone() != null)telefone_update.setText(c.getTelefone());
				if(c.getCelular() != null)celular_update.setText(c.getCelular());
				if(c.getWhatsapp() == 1){
					whatsapp_update.setSelected(true);
				}else{
					whatsapp_update.setSelected(false);
				}

			}

			enableAtualizar();

			SingleSelectionModel<Tab> selectionModel = tabPane.getSelectionModel();

			selectionModel.select(atualizarTab);


		}else{
			Util.Alert("Selecione uma pessoa antes de atualizar!");
		}
	}

	@FXML
	void limpar(ActionEvent event) {
		if(atualizarTab.isSelected()){
			nome_update.clear();dt_nascimento_update.setValue(null);naturalidade_update.clear();cpf_update.clear();
			nomeRua_update.clear();complemento_update.clear();numero_update.clear();email_update.clear();telefone_update.clear();
			celular_update.clear();whatsapp_update.setSelected(false);cidade_update.getSelectionModel().clearSelection();
			estado_update.getSelectionModel().clearSelection();bairro_update.clear();codigo_listar.setText("C�digo: ");
			disableAtualizar();
		}
	}


	@FXML
	void searchPessoa(KeyEvent event) {
		campo_pesquisa.textProperty().addListener((observableValue, oldValue,newValue)->{
			filteredData.setPredicate(pessoa->{
				if(newValue==null || newValue.isEmpty()){
					return true;
				}
				String lowerCaseFilter = newValue.toLowerCase();
				if(pessoa.getNome().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getNaturalidade().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(String.valueOf(pessoa.getCodPessoa()).contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getStatus().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getDt_nascimento().toLocalDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")).contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getCpf() != null){
					if(pessoa.getCpf().toLowerCase().contains(lowerCaseFilter)){
						return true;
					}
				}

				return false;
			});
		});
		SortedList<Pessoa> sortedData = new SortedList<>(filteredData);
		sortedData.comparatorProperty().bind(table_pessoas.comparatorProperty());
		table_pessoas.setItems(sortedData);
	}

	@FXML
	void searchPessoa2(KeyEvent event){
		campo_pesquisa2.textProperty().addListener((observableValue, oldValue,newValue)->{
			filteredData2.setPredicate(pessoa->{
				if(newValue==null || newValue.isEmpty()){
					return true;
				}
				String lowerCaseFilter = newValue.toLowerCase();
				if(pessoa.getNome().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getNaturalidade().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(String.valueOf(pessoa.getCodPessoa()).contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getStatus().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getDt_nascimento().toLocalDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")).contains(lowerCaseFilter)){
					return true;
				}
				else if(pessoa.getCpf() != null){
					if(pessoa.getCpf().toLowerCase().contains(lowerCaseFilter)){
						return true;
					}
				}

				return false;
			});
		});
		SortedList<Pessoa> sortedData = new SortedList<>(filteredData2);
		sortedData.comparatorProperty().bind(table_pessoas2.comparatorProperty());
		table_pessoas2.setItems(sortedData);
	}

	void initTables(){
		oblist.clear();

		oblist = UtilDao.daoPessoa.getAllPessoa();

		filteredData = new FilteredList<>(oblist);
		filteredData2 = new FilteredList<>(oblist);

		col_nome.setCellValueFactory(new PropertyValueFactory<>("nome"));
		col_cpf.setCellValueFactory(new PropertyValueFactory<>("cpf"));
		col_naturalidade.setCellValueFactory(new PropertyValueFactory<>("naturalidade"));
		col_status.setCellValueFactory(new PropertyValueFactory<>("status"));
		col_codPessoa.setCellValueFactory(new PropertyValueFactory<>("codPessoa"));
		col_dt_nascimento.setCellValueFactory(new PropertyValueFactory<>("dt_nascimento"));

		col_dt_nascimento.setCellFactory(column -> {
			TableCell<Pessoa, Date> cell = new TableCell<Pessoa, Date>() {
				private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

				@Override
				protected void updateItem(Date item, boolean empty) {
					super.updateItem(item, empty);
					if(empty) {
						setText(null);
					}
					else {
						this.setText(format.format(item));
					}
				}
			};
			return cell;
		});

		table_pessoas.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
			if (newSelection != null) {
				Pessoa selectedPessoa = table_pessoas.getSelectionModel().getSelectedItem();
				int cod = selectedPessoa.getCodPessoa();

				this.oblistEnderecos.clear();

				if(selectedPessoa != null){
					//Endereco
					Endereco end = UtilDao.daoEnderecos.getEndereco(cod);
					if(end != null){

						nomeRua_listar.setText(end.getRua());
						numero_listar.setText(String.valueOf(end.getNumero()));
						complemento_listar.clear();
						complemento_listar.setText(end.getComplemento());
						bairro_listar.setText(end.getBairro());
						cidade_listar.setText(end.getCidade());
						estado_listar.setText(end.getEstado());
					}
					//Contatos
					Contato con = UtilDao.daoContatos.getContato(cod);
					celular_listar.clear();email_listar.clear();telefone_listar.clear();
					if(con != null){
						if(con.getCelular() != null)celular_listar.setText(con.getCelular());
						if(con.getEmail() != null)email_listar.setText(con.getEmail());
						if(con.getTelefone() != null)telefone_listar.setText(con.getTelefone());
						if(con.getWhatsapp() == 1){
							whatsapp_listar.setSelected(true);
						}else{
							whatsapp_listar.setSelected(false);
						}
					}

				}

			}
		});

		col_nome2.setCellValueFactory(new PropertyValueFactory<>("nome"));
		col_cpf2.setCellValueFactory(new PropertyValueFactory<>("cpf"));
		col_naturalidade2.setCellValueFactory(new PropertyValueFactory<>("naturalidade"));
		col_status2.setCellValueFactory(new PropertyValueFactory<>("status"));
		col_codPessoa2.setCellValueFactory(new PropertyValueFactory<>("codPessoa"));
		col_dt_nascimento2.setCellValueFactory(new PropertyValueFactory<>("dt_nascimento"));

		col_dt_nascimento2.setCellFactory(column -> {
			TableCell<Pessoa, Date> cell = new TableCell<Pessoa, Date>() {
				private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

				@Override
				protected void updateItem(Date item, boolean empty) {
					super.updateItem(item, empty);
					if(empty) {
						setText(null);
					}
					else {
						this.setText(format.format(item));
					}
				}
			};
			return cell;
		});


		table_pessoas.setItems(oblist);
		table_pessoas2.setItems(oblist);
	}


	public boolean checkTextFields(){

		if(atualizarTab.isSelected()){
			TextFieldFormatter tff = new TextFieldFormatter();

			if(nome_update.getText().length() == 0 || nome_update.getText() == null){
				Util.Alert("Verifique o nome!");
				return false;
			}

			if(cpf_update.getText().length() > 0){
				if(cpf_update.getText().length() < 11 || (cpf_update.getText().length() > 11 && cpf_update.getText().length() < 14)){
					Util.Alert("Verifique o CPF!");
					return false;
				}else{
					tff = new TextFieldFormatter();
					tff.setMask("###.###.###-##");
					tff.setCaracteresValidos("0123456789");
					tff.setTf(cpf_update);
					tff.formatter();
				}
			}

			if(naturalidade_update.getText().length() < 1 || naturalidade_update.getText() == null){
				Util.Alert("Verifique a naturalidade!");
				return false;
			}

			if(dt_nascimento_update.getValue() == null){
				Util.Alert("Verifique a Data de nascimento!");
				return false;
			}

			if(nomeRua_update.getText().length() < 1){
				Util.Alert("Verifique o nome da rua!");
				return false;
			}

			if(numero_update.getText().length() < 1){
				Util.Alert("Digite o n�mero da resid�ncia!");
				return false;
			}

			if(bairro_update.getText().length() < 1){
				Util.Alert("Digite o nome do bairro!");
				return false;
			}

			if(estado_update.getSelectionModel().getSelectedItem() == null){
				Util.Alert("Selecione o estado!");
				return false;
			}

			if(cidade_update.getSelectionModel().getSelectedItem() == null){
				Util.Alert("Selecione a cidade!");
				return false;
			}

			if(email_update.getText().length() > 0){
				if(!Util.validarEmail(email_update.getText())){
					Util.Alert("Verifique o email!");
					return false;
				}
			}


			if(celular_update.getText().length() > 0){
				if(celular_update.getText().length() < 11 || (celular_update.getText().length() > 11 && celular_update.getText().length() < 14)){
					Util.Alert("Verifique o n�mero de celular!");
					return false;
				}else{
					tff.setMask("(##)#####-####");
					tff.setCaracteresValidos("0123456789");
					tff.setTf(celular_update);
					tff.formatter();
				}
			}

			if(telefone_update.getText().length() > 0){
				if(telefone_update.getText().length() < 10 || (telefone_update.getText().length() > 10 && telefone_update.getText().length() < 13)){
					Util.Alert("Verifique o n�mero de telefone!");
					return false;
				}else{
					tff.setMask("(##)####-####");
					tff.setCaracteresValidos("0123456789");
					tff.setTf(telefone_update);
					tff.formatter();
				}
			}

		}

		return true;

	}

	@FXML
	void formatNumeroTxt(KeyEvent event){
		if(atualizarTab.isSelected()){
			TextFieldFormatter tff = new TextFieldFormatter();
			tff.setMask("#####");
			tff.setCaracteresValidos("0123456789");
			tff.setTf(numero_update);
			tff.formatter();
		}

	}


	void populateBoxes(){

		estado_update.getItems().addAll("Acre","Alagoas","Amap�","Amazonas","Bahia","Cear�","Distrito Federal",
				"Esp�rito Santo","Goi�s","Maranh�o","Mato Grosso","Mato Grosso do Sul","Minas Gerais","Par�","Para�ba",
				"Paran�","Pernambuco","Piau�","Rio de Janeiro",
				"Rio Grande do Norte","Rio Grande do Sul","Rond�nia",
				"Roraima","Santa Catarina","S�o Paulo","Sergipe","Tocantins");

		new AutoCompleteComboBoxListener<>(estado_update);
		new AutoCompleteComboBoxListener<>(cidade_update);
	}

	@FXML
	void populateCidades(ActionEvent event) {
		if(atualizarTab.isSelected()){
			Util.populateCidade(estado_update, cidade_update);
		}

	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {

		populateBoxes();
		initTables();

		atualizarTab.setOnSelectionChanged(e ->{
			if(atualizarTab.isSelected()){
				if(nome_update.getText().isEmpty()){
					Util.Alert("Selecione uma pessoa na aba \"Listar\"");
				}
			}

		});

		disableAtualizar();

	}

}
