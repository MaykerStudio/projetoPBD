package br.com.Acad.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="turmas")
public class Turma {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int codTurma;

	@Column
	private String codCurriculo;

	@Column
	private int anoLetivo;

	@Column
	private int ano;

	public Turma() {
		// TODO Auto-generated constructor stub
	}

	public int getCodTurma() {
		return codTurma;
	}

	public void setCodTurma(int codTurma) {
		this.codTurma = codTurma;
	}

	public String getCodCurriculo() {
		return codCurriculo;
	}

	public void setCodCurriculo(String codCurriculo) {
		this.codCurriculo = codCurriculo;
	}

	public int getAnoLetivo() {
		return anoLetivo;
	}

	public void setAnoLetivo(int anoLetivo) {
		this.anoLetivo = anoLetivo;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}


}