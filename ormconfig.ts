require('dotenv').config();

module.exports = {
  type: "postgres",
  url: process.env.DATABASE_URL,
  migrationsTableName: "migrations",
  entities: [`${process.env.NODE_ENV === 'production' ? 'dist/src' : 'src'}/entities/*.*`],
  migrations: ["dist/src/migrations/*.js"],
  cli: {
    migrationsDir: "src/migrations",
    entitiesDir: "dist/src/entities/*.js"
  },
  ssl: true,
  extra: {
    ssl: {
      rejectUnauthorized: false,
    }
  }
};