<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220207132531 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        $this->addSql('CREATE TABLE projects(id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, description TEXT)');
    }

    public function down(Schema $schema) : void
    {
        $this->addSql('DROP TABLE projects');
    }
}
