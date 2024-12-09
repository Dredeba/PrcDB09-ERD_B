CREATE TABLE [product] (
	[product_id] INTEGER NOT NULL IDENTITY UNIQUE,
	[supplier_id] INTEGER NOT NULL UNIQUE,
	PRIMARY KEY([product_id])
);
GO

CREATE TABLE [delivery] (
	[delivery_id] INTEGER NOT NULL IDENTITY UNIQUE,
	[delivery_date] INTEGER NOT NULL,
	[supplier_id] INTEGER NOT NULL,
	PRIMARY KEY([delivery_id], [delivery_date])
);
GO

CREATE TABLE [order_detail_delivery] (
	[delivery_id] INTEGER NOT NULL,
	[order_id] INTEGER NOT NULL UNIQUE,
	[order_detail_id] INTEGER NOT NULL
);
GO

CREATE TABLE [order] (
	[order_id] INTEGER NOT NULL IDENTITY UNIQUE,
	[order_date] INTEGER NOT NULL,
	[headquarters_id] INTEGER NOT NULL,
	PRIMARY KEY([order_id])
);
GO

CREATE TABLE [headquarter] (
	[headquarter_id] INTEGER NOT NULL IDENTITY UNIQUE,
	[branch_id] INTEGER NOT NULL,
	PRIMARY KEY([headquarter_id])
);
GO

CREATE TABLE [supplier] (
	[delivery_id] INTEGER NOT NULL IDENTITY UNIQUE,
	[delivery_date] INTEGER NOT NULL UNIQUE,
	[supplier_id] INTEGER NOT NULL IDENTITY UNIQUE,
	PRIMARY KEY([supplier_id])
);
GO

CREATE TABLE [branch] (
	[branch_id] INTEGER NOT NULL IDENTITY UNIQUE,
	PRIMARY KEY([branch_id])
);
GO

CREATE TABLE [order_detail] (
	[order_detail_id] INTEGER NOT NULL IDENTITY UNIQUE,
	[product_id] INTEGER NOT NULL,
	[order_id] INTEGER NOT NULL,
	[product_quantity] INTEGER NOT NULL,
	PRIMARY KEY([order_detail_id])
);
GO

ALTER TABLE [delivery]
ADD FOREIGN KEY([delivery_date]) REFERENCES [supplier]([delivery_date])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [order_detail_delivery]
ADD FOREIGN KEY([order_id]) REFERENCES [delivery]([delivery_id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [order_detail_delivery]
ADD FOREIGN KEY([order_detail_id]) REFERENCES [order_detail]([order_detail_id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [product]
ADD FOREIGN KEY([product_id]) REFERENCES [order_detail]([order_detail_id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [product]
ADD FOREIGN KEY([supplier_id]) REFERENCES [supplier]([supplier_id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [order]
ADD FOREIGN KEY([headquarters_id]) REFERENCES [headquarter]([headquarter_id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [order_detail]
ADD FOREIGN KEY([product_id]) REFERENCES [order]([order_date])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [branch]
ADD FOREIGN KEY([branch_id]) REFERENCES [headquarter]([branch_id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO