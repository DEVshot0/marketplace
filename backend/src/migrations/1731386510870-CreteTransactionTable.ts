import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateTransactionTable1632317329422 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      CREATE TABLE "transaction" (
        "id" SERIAL PRIMARY KEY,
        "adId" INTEGER NOT NULL,
        "userId" INTEGER NOT NULL,
        "status" VARCHAR(50) NOT NULL,
        "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY ("adId") REFERENCES "ad"("id") ON DELETE CASCADE,
        FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE
      );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "transaction"`);
  }
}
