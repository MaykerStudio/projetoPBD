package br.com.Acad.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.Dom4JDriver;

public class Settings {

	private static int[] opcoesLista = new int[5];
	private static String userHomeFolder = System.getProperty("user.dir");
	private static XStream xStream = new XStream(new Dom4JDriver());
	private static File file = new File(userHomeFolder, "Settings.xml");

	public static void Save(int[] opcoes) {

		try {
			if (!file.exists()) {
				file.createNewFile();
			}
			else {
				file.delete();
				file.createNewFile();
			}

			opcoesLista = opcoes;
			OutputStream stream = new FileOutputStream(file);
			xStream.toXML(opcoesLista, stream);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static int[] get() {
		if (!file.exists()) {
			int[] op = new int[5];
			op[0] = 1;
			op[1] = 1;
			op[2] = 00;
			op[3] = 00;
			op[4] = 00;
			Save(op);
			return opcoesLista;
		} else {
			int[] op = new int[5];
			try {
				op = (int[]) xStream.fromXML(file);
			} catch (Throwable e) {
				op[0] = 1;
				op[1] = 1;
				op[2] = 00;
				op[3] = 00;
				op[4] = 00;
			}
			Save(op);
			return op;
		}

	}

}
