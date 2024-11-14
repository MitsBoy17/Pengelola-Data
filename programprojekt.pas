program projekt;

uses crt;

const
    MAX_PRODUK = 100;

type
    TProduk = record
        id: Integer;
        nama: string[50];
        harga: Real;
        stok: Integer;
    end;

var
    produk: array[1..MAX_PRODUK] of TProduk;
    jumlahProduk: Integer;

procedure TambahProduk;
var
    p: TProduk;
begin
    if jumlahProduk >= MAX_PRODUK then
    begin
        writeln('Jumlah produk sudah mencapai batas maksimum.');
        exit;
    end;

    writeln('Masukkan ID Produk:');
    readln(p.id);
    writeln('Masukkan Nama Produk:');
    readln(p.nama);
    writeln('Masukkan Harga Produk:');
    readln(p.harga);
    writeln('Masukkan Stok Produk:');
    readln(p.stok);

    Inc(jumlahProduk);
    produk[jumlahProduk] := p;

    writeln('Produk berhasil ditambahkan.');
end;

procedure TampilkanProduk;
var
    i: Integer;
begin
    if jumlahProduk = 0 then
    begin
        writeln('Tidak ada produk untuk ditampilkan.');
        exit;
    end;

    writeln('Daftar Produk:');
    for i := 1 to jumlahProduk do
    begin
        with produk[i] do
        begin
            writeln('ID: ', id);
            writeln('Nama: ', nama);
            writeln('Harga: ', harga:0:2);
            writeln('Stok: ', stok);
            writeln('-------------------------');
        end;
    end;
end;

procedure HapusProduk;
var
    idHapus, i, j: Integer;
    ditemukan: Boolean;
begin
    if jumlahProduk = 0 then
    begin
        writeln('Tidak ada produk untuk dihapus.');
        exit;
    end;

    writeln('Masukkan ID Produk yang ingin dihapus:');
    readln(idHapus);
    ditemukan := False;

    for i := 1 to jumlahProduk do
    begin
        if produk[i].id = idHapus then
        begin
            ditemukan := True;
            for j := i to jumlahProduk - 1 do
            begin
                produk[j] := produk[j + 1];
            end;
            Dec(jumlahProduk);
            writeln('Produk dengan ID ', idHapus, ' berhasil dihapus.');
            Break;
        end;
    end;

    if not ditemukan then
        writeln('Produk dengan ID ', idHapus, ' tidak ditemukan.');
end;

var
    pilihan: Integer;

begin
    jumlahProduk := 0;
    repeat
        clrscr;
        writeln('Pengelolaan Data Produk Toko Online');
        writeln('1. Tambah Produk');
        writeln('2. Tampilkan Produk');
        writeln('3. Hapus Produk');
        writeln('4. Keluar');
        write('Pilih menu (1-4): ');
        readln(pilihan);

        case pilihan of
            1: TambahProduk;
            2: TampilkanProduk;
            3: HapusProduk;
            4: writeln('Terima kasih! Keluar dari program.');
        else
            writeln('Pilihan tidak valid. Silakan coba lagi.');
        end;

        writeln('Tekan Enter untuk melanjutkan...');
        readln;
    until pilihan = 4;
end.