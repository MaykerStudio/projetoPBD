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
import java.util.Arrays;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXCheckBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXTabPane;
import com.jfoenix.controls.JFXTextField;

import br.com.Acad.model.Contato;
import br.com.Acad.model.Curriculo;
import br.com.Acad.model.CurriculoDisciplina;
import br.com.Acad.model.CurriculoDisciplinaID;
import br.com.Acad.model.Endereco;
import br.com.Acad.model.Pessoa;
import br.com.Acad.model.Disciplina;
import br.com.Acad.model.DisciplinaProfessor;
import br.com.Acad.model.DisciplinaProfessorID;
import br.com.Acad.model.Professor;
import br.com.Acad.model.ViewProfessor;
import br.com.Acad.sql.ConnectionClass;
import br.com.Acad.util.AutoCompleteComboBoxListener;
import br.com.Acad.util.TextFieldFormatter;
import br.com.Acad.util.Util;
import br.com.Acad.util.UtilDao;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
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
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;

public class ProfessorManagerController implements Initializable{

	@FXML
	private JFXTabPane tabPane;

	@FXML
	private AnchorPane addDisciplinaContainer;

	@FXML
	private Tab listarTab;

	@FXML
	private JFXTextField campo_pesquisa;

	@FXML
	private TableView<ViewProfessor> table_pessoas;

	@FXML
	private TableColumn<ViewProfessor, String> col_codPessoa;

	@FXML
	private TableColumn<ViewProfessor, String> col_nome;

	@FXML
	private TableColumn<ViewProfessor, String> col_cpf;

	@FXML
	private TableColumn<ViewProfessor, Date> col_dt_nascimento;

	@FXML
	private TableColumn<ViewProfessor, String> col_naturalidade;

	@FXML
	private TableColumn<ViewProfessor, String> col_formacao1;

	@FXML
	private TableColumn<ViewProfessor, String> col_curso1;

	@FXML
	private TableColumn<ViewProfessor, String> col_status;

	@FXML
	private JFXTextField nomeRua_listar;

	@FXML
	private JFXTextField numero_listar;

	@FXML
	private JFXTextField complemento_listar;

	@FXML
	private JFXTextField bairro_listar;

	@FXML
	private JFXTextField cidade_listar;

	@FXML
	private JFXTextField estado_listar;

	@FXML
	private JFXTextField email_listar;

	@FXML
	private JFXTextField telefone_listar;

	@FXML
	private JFXTextField celular_listar;

	@FXML
	private JFXCheckBox whatsapp_listar;

	@FXML
	private Tab atualizarTab;

	@FXML
	private VBox vbox_atualizar;

	@FXML
	private Label codigo_listar;

	@FXML
	private JFXTextField nome_update;

	@FXML
	private JFXDatePicker dt_nascimento_update;

	@FXML
	private JFXTextField naturalidade_update;

	@FXML
	private JFXTextField cpf_update;

	@FXML
	private JFXTextField nomeRua_update;

	@FXML
	private JFXTextField numero_update;

	@FXML
	private JFXTextField complemento_update;

	@FXML
	private JFXTextField bairro_update;

	@FXML
	private JFXTextField cursoFormacao;

	@FXML
	private ComboBox<String> formacao;

	@FXML
	private ComboBox<String> estado_update;

	@FXML
	private ComboBox<String> cidade_update;

	@FXML
	private JFXTextField email_update;

	@FXML
	private JFXTextField telefone_update;

	@FXML
	private JFXTextField celular_update;

	@FXML
	private JFXCheckBox whatsapp_update;

	@FXML
	private Tab desativarTab;

	@FXML
	private JFXTextField campo_pesquisa2;

	@FXML
	private TableView<Professor> table_professores;

	@FXML
	private TableColumn<Professor, String> col_codProfessor;

	@FXML
	private TableColumn<Professor, String> col_nomeProfessor;

	@FXML
	private TableColumn<Professor, String> col_cpf_prof;

	@FXML
	private TableColumn<Professor, String> col_formacao;

	@FXML
	private TableColumn<Professor, String> col_curso;

	@FXML
	private TableView<DisciplinaProfessor> table_disciplinas;

	@FXML
	private TableColumn<DisciplinaProfessor, DisciplinaProfessorID> col_codDisciplina;

	@FXML
	private TableColumn<DisciplinaProfessor, String> col_nomeDisciplina;

	@FXML
	private TableColumn<DisciplinaProfessor, DisciplinaProfessorID> col_serieDisciplina;

	@FXML
	private JFXTextField curriculo;

	@FXML
	private JFXTextField anoLetivo;

	@FXML
	private JFXTextField cargahoraria;

	@FXML
	private DialogPane addDisciplinaPane;

	@FXML
	private TableView<CurriculoDisciplina> table_disciplinas_add;

	@FXML
	private TableColumn<CurriculoDisciplina, CurriculoDisciplinaID> col_codDisciplina_add;

	@FXML
	private TableColumn<CurriculoDisciplina, String> col_nomeDisciplina_add;

	@FXML
	private TableColumn<CurriculoDisciplina, CurriculoDisciplinaID> col_serieDisciplina_add;

	@FXML
	private TableColumn<CurriculoDisciplina, Integer> col_cargaHoraria_add;

	@FXML
	private TableView<Curriculo> table_curriculo;

	@FXML
	private TableColumn<Curriculo, String> col_cod_cur;

	@FXML
	private TableColumn<Curriculo, String> col_nome_cur;

	@FXML
	private TableColumn<Curriculo, String> col_tipo_cur;

	@FXML
	private Button add_button;

	private ObservableList<ViewProfessor> oblist_pessoas = FXCollections.observableArrayList();

	private ObservableList<Professor> oblist_professores = FXCollections.observableArrayList();

	private ObservableList<DisciplinaProfessor> oblist_disciplinas = FXCollections.observableArrayList();

	private ObservableList<CurriculoDisciplina> oblist_disciplinas_add = FXCollections.observableArrayList();

	private ObservableList<Curriculo> oblist_curriculos = FXCollections.observableArrayList();

	private FilteredList<ViewProfessor> filteredData;

	private FilteredList<Professor> filteredData2;

	private String oldCPF;

	@FXML
	void adicionar(ActionEvent event) {
		BoxBlur blur = new BoxBlur(3, 3, 3);
		addDisciplinaContainer.setEffect(blur);
		Professor pr = table_professores.getSelectionModel().getSelectedItem();
		if(pr == null){
			Util.Alert("Selecione um professor!");
			event.consume();
			return;
		}
		addDisciplinaPane.setVisible(true);
		table_professores.setMouseTransparent(true);
		table_disciplinas.setMouseTransparent(true);
		add_button.setVisible(false);
	}

	@FXML
	void removerDisciplina(ActionEvent event) {
		DisciplinaProfessor selected = table_disciplinas.getSelectionModel().getSelectedItem();
		if(selected != null) {
			selected.setNomeProfessor(table_professores.getSelectionModel().getSelectedItem().getNome());
			JFXButton yes = new JFXButton("Remover");
			yes.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent even1) ->{
				UtilDao.daoProfessor.removeDisciplinaProfessor(selected);
				initTables();
			});
			JFXButton cancel = new JFXButton("Cancelar");
	    	cancel.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent event2) -> {
	    		Util.contentPane.getChildren().get(0).setEffect(null);
	    	});

	    	Util.confirmation(Arrays.asList(yes, cancel),"Tem certeza que deseja remover a disciplina do professor?");
		}else{
			Util.Alert("Selecione uma disciplina do professor!");
		}
	}

	@FXML
	void aplicar(ActionEvent event) {
		CurriculoDisciplina cd = table_disciplinas_add.getSelectionModel().getSelectedItem();
		Professor pr = table_professores.getSelectionModel().getSelectedItem();
		if(cd != null && pr != null){

			DisciplinaProfessor dp = new DisciplinaProfessor();
			dp.setCodProfessor(pr.getCodPessoa());
			dp.setId(new DisciplinaProfessorID(cd.getId().getCodCurriculo(), cd.getId().getCodDisciplina(), cd.getId().getAno()));
			dp.setNomeProfessor(pr.getNome());

			UtilDao.daoProfessor.addDisciplinaToProfessor(dp);
			addDisciplinaPane.setVisible(false);

			initTables();

			cancelar(event);

			table_professores.getSelectionModel().select(pr);
		}
	}


	@FXML
	void cancelar(ActionEvent event) {
		addDisciplinaContainer.setEffect(null);
		addDisciplinaPane.setVisible(false);
		table_professores.setMouseTransparent(false);
		table_disciplinas.setMouseTransparent(false);
		add_button.setVisible(true);
	}

	@FXML
	void atualizar(ActionEvent event) throws SQLException {
		if(checkTextFields()){
			oblist_pessoas = UtilDao.daoProfessor.getAllProfessoresView();
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
			Pessoa p = UtilDao.daoPessoa.getPessoa(Integer.valueOf(codigo_listar.getText()));
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
			Professor pr = UtilDao.daoProfessor.getProfessor(cod);
			pr.setCursoFormacao(cursoFormacao.getText());
			pr.setNome(nome_update.getText());
			pr.setFormacao(formacao.getSelectionModel().getSelectedItem());
			UtilDao.daoProfessor.updateProfessor(pr);

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

		}
	}

	@FXML
	void formatNumeroTxt(KeyEvent event) {
		if(atualizarTab.isSelected()){
			TextFieldFormatter tff = new TextFieldFormatter();
			tff.setMask("#####");
			tff.setCaracteresValidos("0123456789");
			tff.setTf(numero_update);
			tff.formatter();
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
	void populateCidades(ActionEvent event) {
		if(atualizarTab.isSelected()){
			Util.populateCidade(estado_update, cidade_update);
		}
	}

	void populateBoxes(){

		estado_update.getItems().addAll("Acre","Alagoas","Amap�","Amazonas","Bahia","Cear�","Distrito Federal",
				"Esp�rito Santo","Goi�s","Maranh�o","Mato Grosso","Mato Grosso do Sul","Minas Gerais","Par�","Para�ba",
				"Paran�","Pernambuco","Piau�","Rio de Janeiro",
				"Rio Grande do Norte","Rio Grande do Sul","Rond�nia",
				"Roraima","Santa Catarina","S�o Paulo","Sergipe","Tocantins");
		formacao.getItems().addAll("Licenciatura", "Normal Superior", "Magist�rio", "Pedagogia", "Bacharelado");

		new AutoCompleteComboBoxListener<>(estado_update);
		new AutoCompleteComboBoxListener<>(cidade_update);
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
		SortedList<ViewProfessor> sortedData = new SortedList<>(filteredData);
		sortedData.comparatorProperty().bind(table_pessoas.comparatorProperty());
		table_pessoas.setItems(sortedData);
	}

	@FXML
	void searchPessoa2(KeyEvent event) {
		campo_pesquisa2.textProperty().addListener((observableValue, oldValue,newValue)->{
			filteredData2.setPredicate(professor->{
				if(newValue==null || newValue.isEmpty()){
					return true;
				}
				String lowerCaseFilter = newValue.toLowerCase();
				if(professor.getNome().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(professor.getCpf().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}
				else if(String.valueOf(professor.getCodPessoa()).contains(lowerCaseFilter)){
					return true;
				}
				else if(professor.getCursoFormacao().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}

				else if(professor.getFormacao().toLowerCase().contains(lowerCaseFilter)){
					return true;
				}

				return false;
			});
		});
		SortedList<Professor> sortedData = new SortedList<>(filteredData2);
		sortedData.comparatorProperty().bind(table_professores.comparatorProperty());
		table_professores.setItems(sortedData);
	}

	@FXML
	void selecionarPessoa(ActionEvent event) {
		ViewProfessor p = table_pessoas.getSelectionModel().getSelectedItem();
		if(p != null){
			limpar(event);

			codigo_listar.setText(String.valueOf(p.getCodPessoa()));

			Endereco e = UtilDao.daoEnderecos.getEndereco(p.getCodPessoa());
			Contato c = UtilDao.daoContatos.getContato(p.getCodPessoa());

			Professor pr = UtilDao.daoProfessor.getProfessor(p.getCodPessoa());

			nome_update.setText(p.getNome());
			naturalidade_update.setText(p.getNaturalidade());
			if(p.getCpf() != null){
				cpf_update.setText(p.getCpf());
				oldCPF = p.getCpf();
			}
			LocalDate dt = LocalDate.parse(p.getDt_nascimento().toLocalDate().toString());
			dt_nascimento_update.setValue(dt);

			nomeRua_update.setText(e.getRua());
			numero_update.setText(String.valueOf(e.getNumero()));
			complemento_update.setText(e.getComplemento());
			bairro_update.setText(e.getBairro());
			estado_update.getSelectionModel().select(e.getEstado());
			cidade_update.getSelectionModel().select(e.getCidade());
			formacao.getSelectionModel().select(pr.getFormacao());
			cursoFormacao.setText(pr.getCursoFormacao());

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

	void disableAtualizar(){
		vbox_atualizar.setDisable(true);
	}

	void enableAtualizar(){
		vbox_atualizar.setDisable(false);
	}

	void initTables(){

		oblist_disciplinas.clear();
		oblist_pessoas.clear();
		oblist_professores.clear();

		oblist_pessoas = UtilDao.daoProfessor.getAllProfessoresView();

		oblist_curriculos = UtilDao.daoCurriculo.getAllCurriculo();

		oblist_professores = UtilDao.daoProfessor.getAllProfessores();
		if(!oblist_pessoas.isEmpty()){
			for (int i = 0; i < oblist_pessoas.size(); i++) {
				oblist_professores.get(i).setNome(oblist_pessoas.get(i).getNome());
			}
		}


		filteredData = new FilteredList<>(oblist_pessoas);
		filteredData2 = new FilteredList<>(oblist_professores);

		//Pessoas
		col_codPessoa.setCellValueFactory(new PropertyValueFactory<>("codPessoa"));
		col_nome.setCellValueFactory(new PropertyValueFactory<>("nome"));
		col_cpf.setCellValueFactory(new PropertyValueFactory<>("cpf"));
		col_naturalidade.setCellValueFactory(new PropertyValueFactory<>("naturalidade"));
		col_status.setCellValueFactory(new PropertyValueFactory<>("status"));
		col_codPessoa.setCellValueFactory(new PropertyValueFactory<>("codPessoa"));
		col_dt_nascimento.setCellValueFactory(new PropertyValueFactory<>("dt_nascimento"));
		col_formacao1.setCellValueFactory(new PropertyValueFactory<>("formacao"));
		col_curso1.setCellValueFactory(new PropertyValueFactory<>("cursoFormacao"));


		col_dt_nascimento.setCellFactory(column -> {
			TableCell<ViewProfessor, Date> cell = new TableCell<ViewProfessor, Date>() {
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

		table_pessoas.setItems(oblist_pessoas);

		table_pessoas.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
			if (newSelection != null) {
				ViewProfessor selectedPessoa = table_pessoas.getSelectionModel().getSelectedItem();
				int cod = selectedPessoa.getCodPessoa();

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

		col_codProfessor.setCellValueFactory(new PropertyValueFactory<>("codPessoa"));
		col_nomeProfessor.setCellValueFactory(new PropertyValueFactory<>("nome"));
		col_cpf_prof.setCellValueFactory(new PropertyValueFactory<>("cpf"));
		col_formacao.setCellValueFactory(new PropertyValueFactory<>("formacao"));
		col_curso.setCellValueFactory(new PropertyValueFactory<>("cursoFormacao"));

		table_professores.setItems(oblist_professores);
		Util.autoFitTable(table_professores);

		table_professores.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
			if(newSelection != null){
				Professor selected = table_professores.getSelectionModel().getSelectedItem();
				if(selected != null){
					oblist_disciplinas.clear();
					oblist_disciplinas = UtilDao.daoProfessor.getDisciplinaOfProfessor(selected.getCodPessoa());
					for(DisciplinaProfessor dp: oblist_disciplinas){
						Disciplina d = UtilDao.daoDisciplina.getDisciplina(dp.getId().getCodDisciplina());
						dp.setNomeDisciplina(d.getNome());
					}
					table_disciplinas.setItems(oblist_disciplinas);

					curriculo.clear();
				}
			}

		});


		col_codDisciplina.setCellValueFactory(new PropertyValueFactory<>("id"));
		col_nomeDisciplina.setCellValueFactory(new PropertyValueFactory<>("nomeDisciplina"));
		col_serieDisciplina.setCellValueFactory(new PropertyValueFactory<>("id"));

		col_codDisciplina.setCellFactory(column -> {
			final TableCell<DisciplinaProfessor, DisciplinaProfessorID> cell = new TableCell<DisciplinaProfessor, DisciplinaProfessorID>(){
				@Override
				protected void updateItem(DisciplinaProfessorID item, boolean empty) {
					super.updateItem(item, empty);

					if(empty){
						this.setText("");
					}else{
						this.setText(item.getCodDisciplina());
					}

				}

			};
			return cell;
		});

		col_serieDisciplina.setCellFactory(column -> {
			final TableCell<DisciplinaProfessor, DisciplinaProfessorID> cell = new TableCell<DisciplinaProfessor, DisciplinaProfessorID>(){
				@Override
				protected void updateItem(DisciplinaProfessorID item, boolean empty) {
					super.updateItem(item, empty);

					if(empty){
						this.setText("");
					}else{
						this.setText(String.valueOf(item.getAno())+"� ano");
					}

				}

			};
			return cell;
		});

		table_disciplinas.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
			if(newSelection != null){
				DisciplinaProfessor selected = table_disciplinas.getSelectionModel().getSelectedItem();
				if(selected != null) {
					Curriculo c = UtilDao.daoCurriculo.getCurriculo(selected.getId().getCodCurriculo());
					curriculo.setText(c.getNome());
				}
			}
		});

		col_cod_cur.setCellValueFactory(new PropertyValueFactory<>("codCurriculo"));
		col_nome_cur.setCellValueFactory(new PropertyValueFactory<>("nome"));
		col_tipo_cur.setCellValueFactory(new PropertyValueFactory<>("tipo"));

		table_curriculo.setItems(oblist_curriculos);

		table_curriculo.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
			if(newSelection != null){
				Curriculo selected = table_curriculo.getSelectionModel().getSelectedItem();
				if(selected != null){
					oblist_disciplinas_add.clear();
					oblist_disciplinas_add = UtilDao.daoCurriculo.getAllDisciplinas(selected.getCodCurriculo());

					for(CurriculoDisciplina c : oblist_disciplinas_add){
						c.setNomeDisciplina(((Disciplina)UtilDao.daoDisciplina.getDisciplina(c.getId().getCodDisciplina())).getNome());
					}

					table_disciplinas_add.setItems(oblist_disciplinas_add);
					table_disciplinas_add.getSortOrder().add(col_serieDisciplina_add);

				}
			}
		});

		col_codDisciplina_add.setCellValueFactory(new PropertyValueFactory<>("id"));
		col_nomeDisciplina_add.setCellValueFactory(new PropertyValueFactory<>("nomeDisciplina"));
		col_serieDisciplina_add.setCellValueFactory(new PropertyValueFactory<>("id"));
		col_cargaHoraria_add.setCellValueFactory(new PropertyValueFactory<>("cargaHoraria"));

		col_codDisciplina_add.setCellFactory(column -> {
			final TableCell<CurriculoDisciplina, CurriculoDisciplinaID> cell = new TableCell<CurriculoDisciplina, CurriculoDisciplinaID>(){
				@Override
				protected void updateItem(CurriculoDisciplinaID item, boolean empty) {
					super.updateItem(item, empty);

					if(empty){
						this.setText("");
					}else{
						this.setText(item.getCodDisciplina());
					}

				}

			};
			return cell;
		});

		col_serieDisciplina_add.setCellFactory(column -> {
			final TableCell<CurriculoDisciplina, CurriculoDisciplinaID> cell = new TableCell<CurriculoDisciplina, CurriculoDisciplinaID>(){
				@Override
				protected void updateItem(CurriculoDisciplinaID item, boolean empty) {
					super.updateItem(item, empty);

					if(empty){
						this.setText("");
					}else{
						this.setText(String.valueOf(item.getAno())+"� ano");
					}

				}

			};
			return cell;
		});

		col_cargaHoraria_add.setCellFactory(column -> {
			final TableCell<CurriculoDisciplina, Integer> cell = new TableCell<CurriculoDisciplina, Integer>(){
				@Override
				protected void updateItem(Integer item, boolean empty) {
					super.updateItem(item, empty);

					if(empty){
						this.setText("");
					}else{
						this.setText(String.valueOf(item)+"H");
					}

				}

			};
			return cell;
		});



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

	@Override
	public void initialize(URL location, ResourceBundle resources) {

		atualizarTab.setOnSelectionChanged(e ->{
			if(atualizarTab.isSelected()){
				if(nome_update.getText().isEmpty()){
					Util.Alert("Selecione um professor na aba \"Listar\"");
				}
			}

		});

		populateBoxes();
		initTables();

	}

}
