#Menu Utama
menu() {
#Menampilkan daftar menu dan Letak menu
echo "Menu Utama"
echo "[1] Searching"
echo "[2] Replacing Word"
echo "[3] Browsing"
echo "[4] Matriks"
echo "[9] About"
echo "[0] Exit"
echo -n "Masukkan Pilihan Anda : "
}

#Main Test
main() {
echo -e '\e[0;41m'
clear
menu
read pilihan
if ((pilihan==1)); then
	searching
	elif (( pilihan==2 )); then
		Replacing
	elif ((pilihan==3 )); then
		Browsing
	elif (( pilihan==4 )); then
		Matrik
	elif (( pilihan==9 )); then
		About
	elif [ $pilihan -eq 0 ]; then
		echo -e "\e[0mNormal Text"
		clear
		exit
	else
		main
fi
}

#Method Searching
searching() {
while :
do
echo -e '\e[0;43m'
clear

#Menu Searching
echo "Menu Searching"
echo "[1] Searching Word"
echo "[2] Searching File"
echo "[0] Exit "
read -p "Silahkan masukkan jenis Searching: " search
case $search in
	1) clear
	echo "Searching Word"
	echo " "
	echo "Data :"
	echo " "
	cat  Data
	echo -n "Masukkan kata yang dicari: "
	read pilih
	echo "Hasil pencarian: "$pilih""
	cat  Data | grep --color -i "$pilih" #fungsi i menampilkan semua kata yang dicari
	echo ""
	echo "Tekan <enter> untuk kembali ke menu searching";
	read ;;

	2) clear
	echo 
	echo Searching Files
	echo 
	echo ""
	echo "Masukkan nama file:"
	read files
	echo ""
	echo "Hasil pencarian file: "$files""
	locate $files | grep --color -i "$files"
	echo ""	
	echo "Tekan <enter> untuk kembali ke menu Searching";
	read ;;

	0) main
	esac
done
}

#Method Replacing
Replacing() {
	while :
	do
	echo -e '\e[0;46m'
	clear
	echo 
	echo Word Replacing
	echo 
	echo ""
	cat  Data
	echo ""
	echo "Kata yang akan direplace"
	read Replace
	echo "Replace kata: $Repalce dengan Kata"
	read Replacer
	echo ""
	echo "Hasil Replacing kata $Replace dengan $Replacer :"
	echo ""
	sed -i 's/'"$Replace"'/'"$Replacer"'/g' Data
	rm -f sed* #menghapus semua file yang bernama sed
	cat Data
	echo ""
	echo "Tekan Sembarang Untuk Mereplace Lagi ? [no <Exit>]"
	read pilihan
	case $pilihan in
		no) main
		esac
	done
}

#Method Browsing
Browsing() {
	while :
	do
	echo -e '\e[0;44m'
	clear

#Menu Browsing
	echo "Menu Browsing"
	echo " "
	echo "[1] Browsing via E-links"
	echo "[2] Browsing via Google Chrome"
	echo "[0] Exit"
	echo -n "Silahakan Pilih Metode: "
	read pilih
	case $pilih in
		1) clear
		echo ""
		echo " Browsing via E-links "
		echo ""
		echo "Masukkan url yang akan di kunjungi:";
		read url;
		elinks $url;
		;;
		2) clear
		echo "Browsing via Google Chrome";
		chromium-browser;
		;;
		0) main
		esac
		done
}

#Method Matrik
Matrik() {
	echo -e '\e[0;42m'
	while : 
	do
	clear
	echo ""
	echo "Matrik"
	echo ""
	echo ""
	perl matrixperl.pl
	echo "Tekan sembarang untuk mencoba lagi [no <Exit>]"
	read pilih
	case $pilih in
		yes) 
		;;
		no) main
		esac
		done
}
About(){
	echo -e '\e[0;47m'
	clear
	echo "PRAKTIKUM SISTEM OPERASI"
	echo ""
	echo "Oleh :"
	echo "1310651209 Ahmad Akbar Tanjung"
	echo "1310651004 Umi Latifatul Rofi'ah"
	echo ""
	echo -n "Tekan sembarang untuk Kembali Ke-Menu : "
	read menu
main
}
main
