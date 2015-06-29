import javax.swing.*;
public class Game_Ktemu {
    public static void main(String[] args) {
        JOptionPane.showMessageDialog(null, "Selamat Datang Di Tebak Angka");
        do {
            int a = (int) (Math.random()*10);
            int b = 0;
                do {
                    b  = Integer.parseInt(JOptionPane.showInputDialog("Masukkan Angka Yang Anda Tebak"));
                    if ( b == a ){
                        JOptionPane.showMessageDialog(null, "Angka yang anda masukkan benar " +a);
                        break;}
                    else if ( b < a ){
                        JOptionPane.showMessageDialog(null, "Angka yang anda masukkan terlalu kecil");}
                    else if ( b > a ){
                        JOptionPane.showMessageDialog(null, "Angka yang anda masukkan terlalu besar");}
                    } while (a >= 0);
        } while (JOptionPane.showConfirmDialog(null, "Coba Lagi?")==JOptionPane.YES_OPTION);
    }
}
