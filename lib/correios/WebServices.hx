package correios;

typedef Service = {
    name:String,
    code: String
}

@:enum abstract AvailableServices (String) {
  public var Sedex = "40010"; // {name: "Sedex Varejo", code: "40010"};
  public var SedexACobrar = "40045"; //{name: "Sedex a Cobrar Varejo", code: "40045"};
//  public var Sedex10 = {name: "Sedex 10 Varejo", code: "40215"};
//  public var SedexHoje = {name: "Sedex Hoje Varejo", code: "40290"};
//  public var PAC = {name:"PAC Varejo", code:"41106"}
}

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
    public function calcPrazo(data:Dynamic, cback:Dynamic->Dynamic->Void):Void;
    public function calcPrecoPrazo(data:Dynamic, cback:Dynamic->Dynamic->Void):Void;
}

