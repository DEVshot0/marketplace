import { MigrationInterface, QueryRunner } from "typeorm";

export class AddPurchasedByToAd1731387496649 implements MigrationInterface {
    public async up(queryRunner: QueryRunner): Promise<void> {
      await queryRunner.query(`
        ALTER TABLE "ad"
        ADD "purchasedBy" integer REFERENCES "user"("id") ON DELETE SET NULL;
      `);
    }
  
    public async down(queryRunner: QueryRunner): Promise<void> {
      await queryRunner.query(`
        ALTER TABLE "ad"
        DROP COLUMN "purchasedBy";
      `);
    }
  }