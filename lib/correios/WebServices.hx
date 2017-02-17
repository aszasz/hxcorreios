package correios;

typedef FullRequestData = {
            nCdEmpresa : String,
            sDsSenha : String,
            nCdServico: String,
            sCepOrigem: String,
            sCepDestino: String,
            nVlPeso: String,
            nCdFormato: Int,
            nVlComprimento: Int,
            nVlAltura: Int,
            nVlLargura: Int,
            nVlDiametro: Int,
            sCdMaoPropria: String,
            nVlValorDeclarado: Int,
            sCdAvisoRecebimento: String
}

#if nodejs
@:jsRequire("node-correios")
#else
#error "node-correios requires Node.js.  Compile with `-lib hxnodejs`."
#end
extern class WebServices{
    public function new (); 
    public function calcPreco(data:Dynamic, cback:Dynamic->Dynamic->Void):Void;
}

