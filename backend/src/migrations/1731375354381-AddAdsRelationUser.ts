import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddAdsRelationUser1731375354381 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      CREATE TABLE "ad" (
        "id" SERIAL PRIMARY KEY,
        "title" VARCHAR(255) NOT NULL,
        "description" TEXT NOT NULL,
        "price" DECIMAL NOT NULL,
        "status" VARCHAR(50) DEFAULT 'available',
        "userId" INTEGER NOT NULL,
        CONSTRAINT "FK_user_ad" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE
      );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      DROP TABLE "ad";
    `);
  }
}
