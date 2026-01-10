package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.ProductDetails;

public class ProductDetailsDao extends BaseDao {

    public ProductDetails selectByProductID(int productID) {
        String sql = "SELECT * FROM product_details WHERE productID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ProductDetails d = new ProductDetails();
                    d.setProductID(rs.getInt("productID"));
                    d.setMaterial(rs.getString("material"));
                    d.setFabricWeight(rs.getString("fabric_weight"));
                    d.setColors(rs.getString("colors"));
                    d.setFit(rs.getString("fit"));
                    d.setCare(rs.getString("care"));
                    return d;
                }
            }
        } catch (Exception e) { throw new RuntimeException(e); }
        return null;
    }

    public boolean upsert(ProductDetails d) {
        String sql = "INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care) " +
                     "VALUES (?, ?, ?, ?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE " +
                     "material=VALUES(material), fabric_weight=VALUES(fabric_weight), colors=VALUES(colors), " +
                     "fit=VALUES(fit), care=VALUES(care)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, d.getProductID());
            ps.setString(2, d.getMaterial());
            ps.setString(3, d.getFabricWeight());
            ps.setString(4, d.getColors());
            ps.setString(5, d.getFit());
            ps.setString(6, d.getCare());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { throw new RuntimeException(e); }
    }
}