declare @d date = '12/28/2021';
select FORMAT(@d,'d','en-us')'US English',
FORMAT(@d,'d','en-gb')'British English',
FORMAT(@d,'d','de-de')'German',
FORMAT(@d,'d','zh-cn')'Chinese Simplified (PRC)';

select FORMAT(@d,'D','en-us')'US English',
FORMAT(@d,'D','en-gb')'British English',
FORMAT(@d,'D','de-de')'German',
FORMAT(@d,'D','zh-cn')'Chinese Simlified (PRC)';

declare @d date=getdate();
select FORMAT(@d,'dd/MM/yyyy','en-us')as 'date',
FORMAT(1234567890,'###-###-##-##') as 'Custom Number';

select top(5) CurrencyRateID, EndOfDayRate,
FORMAT(EndOfDayRate,'N','en-us') as 'Numeric Format',
FORMAT(EndOfDayRate,'G','en-us') as 'Generic Format',
FORMAT(EndOfDayRate,'C','en-us') as 'Currency Format'
from Sales.CurrencyRate
order by CurrencyRateID;