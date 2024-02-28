package Models.Classes;

public class Facture {		
		private int id_facture;
		private Commande Cmd;
		public Facture(int id_facture, Commande cmd) {
			this.setId_facture(id_facture);
			setCmd(cmd);
		}
		public Facture(){
	
		}
		public int getId_facture() {
			return id_facture;
		}
		public void setId_facture(int id_facture) {
			this.id_facture = id_facture;
		}
		public Commande getCmd() {
			return Cmd;
		}
		public void setCmd(Commande cmd) {
			Cmd = cmd;
		}
	

}
