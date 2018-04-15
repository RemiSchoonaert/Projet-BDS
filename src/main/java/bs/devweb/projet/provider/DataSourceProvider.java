package bs.devweb.projet.provider;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.sql.DataSource;

/**
 * Cette classe permet de se connecter a la BDD et est utilisable dans toutes les autres classes
 * Il n'y a besoin d'indiquer les parametres de connexion que dans cette classe
 */
public class DataSourceProvider {

    private static MysqlDataSource dataSource;

    public static DataSource getDataSource() {
        if (dataSource == null) {
            dataSource = new MysqlDataSource();
            dataSource.setServerName("localhost");
            dataSource.setPort(3306);
            dataSource.setDatabaseName("projetbds");
            dataSource.setUser("root");
            dataSource.setPassword("root");
        }
        return dataSource;
    }
}

