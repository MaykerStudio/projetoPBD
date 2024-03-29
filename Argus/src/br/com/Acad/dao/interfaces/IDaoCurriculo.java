package br.com.Acad.dao.interfaces;

import br.com.Acad.model.Curriculo;
import br.com.Acad.model.CurriculoDisciplina;
import javafx.collections.ObservableList;

public interface IDaoCurriculo {

	public void addCurriculo(Curriculo curriculo);
	public void updateCurriculo(Curriculo curriculo);
	public void removeCurriculo(Curriculo curriculo);
	public Curriculo getCurriculo(String codCurriculo);
	public void addDisciplinaToCurriculo(CurriculoDisciplina dc);
	public ObservableList<Curriculo> getAllCurriculo();
	public ObservableList<CurriculoDisciplina> getAllDisciplinas(String codCurriculo);

}
