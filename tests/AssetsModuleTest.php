<?php
declare(strict_types = 1);
namespace Slothsoft\Server\Valheim\Tests;

use Slothsoft\Farah\FarahUrl\FarahUrlAuthority;
use Slothsoft\Farah\ModuleTests\AbstractModuleTest;

class AssetsModuleTest extends AbstractModuleTest {

    protected static function getManifestAuthority(): FarahUrlAuthority {
        return FarahUrlAuthority::createFromVendorAndModule('$COMPOSER_VENDOR', '$COMPOSER_MODULE');
    }
}