public class MediumRiskSpec : ISpecification<Trade>
{
    public bool IsSatisfied(Trade trade)
    {
        return 
            trade.Value > 1000000 
            && trade.ClientSector == "Public";
    }
}