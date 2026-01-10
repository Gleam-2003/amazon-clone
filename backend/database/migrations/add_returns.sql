USE amazon_clone;

CREATE TABLE IF NOT EXISTS returns (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    order_item_id INT NOT NULL,
    return_reason VARCHAR(255) NOT NULL,
    return_status ENUM('pending', 'approved', 'rejected', 'refunded', 'completed') DEFAULT 'pending',
    return_quantity INT NOT NULL,
    refund_amount DECIMAL(10, 2) NOT NULL,
    return_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE RESTRICT,
    FOREIGN KEY (order_item_id) REFERENCES order_items(id) ON DELETE RESTRICT,
    INDEX idx_order (order_id),
    INDEX idx_status (return_status)
);

