<?php
declare(strict_types = 1);
namespace Slothsoft\Server\Valheim;

use Slothsoft\FarahTesting\Module\AbstractXmlManifestTest;

final class AssetsManifestTest extends AbstractXmlManifestTest {

    protected static function getManifestDirectory(): string {
        return dirname(__DIR__) . DIRECTORY_SEPARATOR . 'assets';
    }
}