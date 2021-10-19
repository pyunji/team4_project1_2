package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.Stock;

public interface StockDao {
	Stock select(Stock stock);
	int update(Stock stock);
}
