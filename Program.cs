var input = new List<Trade>
{
    new Trade {Value = 100, ClientSector = "Public"},
    new Trade {Value = 1000001, ClientSector = "Public"},
    new Trade {Value = 2000000, ClientSector = "Private"}
};

var result = input.Select(t => t.RiskLevel).ToList();

Console.WriteLine(result.Aggregate((i, j) => i + ", " + j));