<?php

namespace Test;

use PHPUnit\Framework\TestCase;
use Package\Package;

class PackageTest extends TestCase
{
    public function testTrue(): void
    {
        $this->assertTrue(Package::true());
    }
}
