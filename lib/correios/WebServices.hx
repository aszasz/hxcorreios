package correios;

typedef Service = {
    name:String,
    code: String
}

//@:enum abstract AvailableServices (Service) {
//  public var Sedex = {name: "Sedex Varejo", code: "40010"};
//  public var SedexACobrar = {name: "Sedex a Cobrar Varejo", code: "40045"};
//  public var Sedex10 = {name: "Sedex 10 Varejo", code: "40215"};
//  public var SedexHoje = {name: "Sedex Hoje Varejo", code: "40290"};
//  public var PAC = {name:"PAC Varejo", code:"41106"}
//}
//@:enum abstract AvailableServices (String) {
// {name: "Sedex Varejo", code: "40010"};
// {name: "Sedex a Cobrar Varejo", code: "40045"};
// {name: "Sedex 10 Varejo", code: "40215"};
// {name: "Sedex Hoje Varejo", code: "40290"};
// {name: "PAC Varejo", code:"41106"}
//}
/*
Fr4ever contract:
- nCdEmpresa: 11162422
- nDsSenha: 01370682
- códigos de produto no pdf PAC + SEDEX 40096?
*/
 
 typedef PriceResponseData = { 
        Codigo: Int, 
        Valor: String, 
        ValorMaoPropria: String, 
        ValorAvisoRecebimento: String, 
        ValorValorDeclarado : String, 
        Erro : String, 
        MsgErro : String, 
        ValorSemAdicionais : String
        }
typedef TimeDeliveryResponseData = {
        Codigo : Int, 
        PrazoEntrega : String, 
        EntregaDomiciliar : String, 
        EntregaSabado : String, 
        Erro : String, 
        MsgErro : String  
        }

typedef ToRequestDeliveryTime ={ 
            nCdServico: String,
            sCepOrigem: String,
            sCepDestino: String,
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

/*
#if nodejs

@:jsRequire("node-correios")
#else
#error "node-correios requires Node.js.  Compile with `-lib hxnodejs`."
#end
extern class WebServices{
    public function new (); 
    @:native("calcPreco") public function getPrice(data:Dynamic, cback:Dynamic->Dynamic->Void):Void;
    @:native("calcPrazo") public function getDaysToDeliver(data:Dynamic, cback:Dynamic->Dynamic->Void):Void;
    @:native("calcPrecoPrazo") public function getDaysAndPriceToDeliver(data:Dynamic, cback:Dynamic->Dynamic->Void):Void;
}
*/

class WebServices {
    var actionUrl = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?wsdl';

    public function daysToDeliver(rData:ToRequesDeliveryTime, cback:Dynamic->Dynamic->Void)
    {
        var func = function (err:Dynamic, client:Dynamic){
            client.CalcPrazo(rData, cback (err, result.CalcPrazoResult.Servicos.cServico));
        };
        var soap = new NodeSoap()
        soap.createClient(actionUrl, func);
    }       
    public static function getDeliveryInfo(frd:FullRequestData){
        return 'really got this $frd !';

    } 
}

#if nodejs
@:jsRequire("soap")
#else
#error "soap requires Node.js.  Compile with `-lib hxnodejs`."
#end
extern class NodeSoap{
    public function new (); 
    public function createClient(url:String, cback:Dynamic->SoapClient->Void):Void;
}
extern class SoapClient{
    public function CalcPreco(arg:FullRequestData,func:Dynamic->Dynamic->Void)
    public function CalcPrazo(arg:TimetoDelyverRequestData,func:Dynamic->Dynamic->Void)
    public function CalcPrecoPrazo(arg:FullRequestData,func:Dynamic->Dynamic->Void)
}




