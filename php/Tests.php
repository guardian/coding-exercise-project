<?php

use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/code.php';

class Tests extends TestCase
{
    public function testSkeleton()
    {
        $this->assertSame("Hi there!", greeting());
    }
}
