package br.com.Acad.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@SuppressWarnings("serial")
@Embeddable
public class AlunoTurmaID implements Serializable{

	@Column
	private int codAluno;

	@Column
	private String codTurma;

	@Column
	private int anoLetivo;

	public AlunoTurmaID() {
		// TODO Auto-generated constructor stub
	}

	public AlunoTurmaID(int codAluno, String codTurma, int anoLetivo) {
		this.codAluno = codAluno;
		this.codTurma = codTurma;
		this.anoLetivo = anoLetivo;
	}

	public int getCodAluno() {
		return codAluno;
	}

	public String getCodTurma() {
		return codTurma;
	}

	public int getAnoLetivo() {
		return anoLetivo;
	}

	@Override
	public boolean equals(Object obj) {
		if(this == obj) return true;
		if(!(obj instanceof AlunoTurmaID))return false;
		AlunoTurmaID that = (AlunoTurmaID) obj;
		return Objects.equals(getCodAluno(), that.getCodAluno()) && Objects.equals(getCodTurma(), that.getCodTurma()) &&
				Objects.equals(getAnoLetivo(), that.getAnoLetivo());
	}

	@Override
	public int hashCode() {
		return Objects.hash(getCodAluno(), getCodTurma(), getAnoLetivo());
	}

}
