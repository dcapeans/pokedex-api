import {MigrationInterface, QueryRunner} from "typeorm";

export class CreateTables1628268909679 implements MigrationInterface {
    name = 'CreateTables1628268909679'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "users_pokemons" ("usersId" integer NOT NULL, "pokemonsId" integer NOT NULL, CONSTRAINT "PK_f4bc246eaef14b3a2af7f2d16b3" PRIMARY KEY ("usersId", "pokemonsId"))`);
        await queryRunner.query(`CREATE INDEX "IDX_347130834a95292bc92f95eda1" ON "users_pokemons" ("usersId") `);
        await queryRunner.query(`CREATE INDEX "IDX_186672f1f8a7bc81e034438415" ON "users_pokemons" ("pokemonsId") `);
        await queryRunner.query(`ALTER TABLE "sessions" DROP COLUMN "token"`);
        await queryRunner.query(`ALTER TABLE "sessions" ADD "token" character varying NOT NULL`);
        await queryRunner.query(`ALTER TABLE "users_pokemons" ADD CONSTRAINT "FK_347130834a95292bc92f95eda15" FOREIGN KEY ("usersId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE "users_pokemons" ADD CONSTRAINT "FK_186672f1f8a7bc81e034438415d" FOREIGN KEY ("pokemonsId") REFERENCES "pokemons"("id") ON DELETE CASCADE ON UPDATE CASCADE`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users_pokemons" DROP CONSTRAINT "FK_186672f1f8a7bc81e034438415d"`);
        await queryRunner.query(`ALTER TABLE "users_pokemons" DROP CONSTRAINT "FK_347130834a95292bc92f95eda15"`);
        await queryRunner.query(`ALTER TABLE "sessions" DROP COLUMN "token"`);
        await queryRunner.query(`ALTER TABLE "sessions" ADD "token" text NOT NULL`);
        await queryRunner.query(`DROP INDEX "IDX_186672f1f8a7bc81e034438415"`);
        await queryRunner.query(`DROP INDEX "IDX_347130834a95292bc92f95eda1"`);
        await queryRunner.query(`DROP TABLE "users_pokemons"`);
    }

}
