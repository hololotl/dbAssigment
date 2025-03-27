create table Accounts(
 ID int primary key,
 OwnerName varchar(100),
 Balance int,
 Currency varchar(3)
);

insert into accounts (ID, OwnerName, Balance, Currency) values 
(1, 'Account 1', 1500.00, 'USD'),
(2, 'Account 2', 1300.00, 'EUR'),
(3, 'Account 3', 100000.00, 'RUB');

create table Rates (
	CurrencyFrom varchar(3),
	CurrencyTo varchar(3),
	ConversionRate int
);

INSERT INTO Rates (CurrencyFrom, CurrencyTo, ConversionRate) VALUES
('USD', 'EUR', 0.92),
('EUR', 'USD', 1.09),
('USD', 'RUB', 75.00),
('RUB', 'USD', 0.013),
('EUR', 'RUB', 81.00),
('RUB', 'EUR', 0.012);

create or replace function do_transactions()
returns table(ID int, OwnerName varchar(100),Balance int, Currency varchar(3)) as $$
Begin
	Begin
		update accounts set balance = balance - 200 where id = 1;
		update accounts set balance = balance + (200 * 
		(select ConversionRate from rates where CurrencyFrom = 'USD' and CurrencyTo = 'EUR')) 
		where id = 2;
	
		update accounts set balance = balance - 300 where id = 2;
		update accounts set balance = balance + (300 * 
		(select ConversionRate from rates where CurrencyFrom = 'EUR' and CurrencyTo = 'RUB')) 
		where id = 3;
	
		update accounts set balance = balance - 1000 where id = 3;
		update accounts set balance = balance + (1000 * 
		(select ConversionRate from rates where CurrencyFrom = 'RUB' and CurrencyTo = 'USD')) 
		where id = 1;
	
		return a.ID, a.OwnerName, a.Balance, a.Currency from accounts a;

	EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE EXCEPTION 'Error during transactions: %', SQLERRM;
    END;
	return;
end;
$$ language plpgsql;

Begin;
select * from do_transactions();
rollback;

	
	
	
	
	


