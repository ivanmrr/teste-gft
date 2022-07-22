public class Trade
{
    public double Value { get; set; }
    public string ClientSector { get; set;} = null!;
 
    public string RiskLevel 
    {
        get
        {
            if(new LowRiskSpec().IsSatisfied(this)) 
                return "LOWRISK";
            else if(new MediumRiskSpec().IsSatisfied(this)) 
                return "MEDIUMRISK";
            else if(new HighRiskSpec().IsSatisfied(this)) 
                return "HIGHRISK";
            return "DESCONHECIDO";
        }
    }
}
