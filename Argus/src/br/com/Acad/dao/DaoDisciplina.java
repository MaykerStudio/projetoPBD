package br.com.Acad.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;

import br.com.Acad.app.Main;
import br.com.Acad.dao.interfaces.IDaoDisciplina;
import br.com.Acad.exceptions.HandleSQLException;
import br.com.Acad.model.Disciplina;
import br.com.Acad.util.Util;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class DaoDisciplina implements IDaoDisciplina{

	private EntityManager entityMn;

	private ObservableList<Disciplina> oblist = FXCollections.observableArrayList();

	public void createEM() {
		this.entityMn = Main.factory.createEntityManager();
	}

	@Override
	public void addDisciplina(Disciplina disciplina) {
		try {
			createEM();
			if(!entityMn.getTransaction().isActive())
				entityMn.getTransaction().begin();
			entityMn.persist(disciplina);
			entityMn.flush();
			entityMn.clear();
			entityMn.getTransaction().commit();
			Util.Alert("Disciplina cadastrada com sucesso!");
		} catch (PersistenceException e) {
			entityMn.getTransaction().rollback();
			new HandleSQLException(e);
		}finally {
			entityMn.close();
		}
	}

	@Override
	public void updateDisciplina(Disciplina disciplina) {
		try {
			createEM();
			if(!entityMn.getTransaction().isActive())
				entityMn.getTransaction().begin();
			entityMn.merge(disciplina);
			entityMn.flush();
			entityMn.clear();
			entityMn.getTransaction().commit();
			Util.Alert("Disciplina atualizada com sucesso!");
		} catch (PersistenceException e) {
			entityMn.getTransaction().rollback();
			new HandleSQLException(e);
		}finally {
			entityMn.close();
		}

	}

	@Override
	public void removeDisciplina(Disciplina disciplina) {
		try{
			createEM();
			if(!entityMn.getTransaction().isActive())
				entityMn.getTransaction().begin();
			entityMn.remove(entityMn.getReference(Disciplina.class, disciplina.getCodDisciplina()));
			entityMn.flush();
			entityMn.clear();
			entityMn.getTransaction().commit();
			Util.Alert("Disciplina deletada com sucesso!");
		}catch (PersistenceException e) {
			entityMn.getTransaction().rollback();
			new HandleSQLException(e);
		}finally {
			entityMn.close();
		}

	}

	@Override
	public Disciplina getDisciplina(String ID) {
		createEM();
		Disciplina d= entityMn.find(Disciplina.class, ID);
		entityMn.close();
		return d;
	}

	@Override
	public ObservableList<Disciplina> getAllDisciplinas() {
		try {
			createEM();
			@SuppressWarnings("unchecked")
			List<Disciplina> list = entityMn.createQuery("from Disciplina").getResultList();
			oblist = FXCollections.observableList(list);

		} catch (PersistenceException e) {
			new HandleSQLException(e);
		}finally {
			entityMn.close();
		}
		return oblist;
	}

}
