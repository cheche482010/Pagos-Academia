<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitdf0e3945719bcfcc57666cc0e0fb8729
{
    public static $prefixLengthsPsr4 = array (
        'C' => 
        array (
            'Core\\' => 5,
        ),
        'A' => 
        array (
            'App\\' => 4,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Core\\' => 
        array (
            0 => __DIR__ . '/../..' . '/core',
        ),
        'App\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app',
        ),
    );

    public static $classMap = array (
        'App\\Components\\ButtonComponent' => __DIR__ . '/../..' . '/app/Components/ButtonComponent.php',
        'App\\Components\\CardComponent' => __DIR__ . '/../..' . '/app/Components/CardComponent.php',
        'App\\Components\\Component' => __DIR__ . '/../..' . '/app/Components/Component.php',
        'App\\Components\\ContentHeaderComponent' => __DIR__ . '/../..' . '/app/Components/ContentHeaderComponent.php',
        'App\\Components\\FooterComponent' => __DIR__ . '/../..' . '/app/Components/FooterComponent.php',
        'App\\Components\\ImageComponent' => __DIR__ . '/../..' . '/app/Components/ImageComponent.php',
        'App\\Components\\LinkComponent' => __DIR__ . '/../..' . '/app/Components/LinkComponent.php',
        'App\\Components\\MetaComponent' => __DIR__ . '/../..' . '/app/Components/MetaComponent.php',
        'App\\Components\\NavbarNavComponent' => __DIR__ . '/../..' . '/app/Components/NavbarNavComponent.php',
        'App\\Components\\NotificationsComponent' => __DIR__ . '/../..' . '/app/Components/NotificationsComponent.php',
        'App\\Components\\PageHeaderComponent' => __DIR__ . '/../..' . '/app/Components/PageHeaderComponent.php',
        'App\\Components\\ScriptComponent' => __DIR__ . '/../..' . '/app/Components/ScriptComponent.php',
        'App\\Components\\SidebarMenuComponent' => __DIR__ . '/../..' . '/app/Components/SidebarMenuComponent.php',
        'App\\Components\\SmallBoxComponent' => __DIR__ . '/../..' . '/app/Components/SmallBoxComponent.php',
        'App\\Controllers\\BaseController' => __DIR__ . '/../..' . '/app/Controllers/BaseController.php',
        'App\\Controllers\\ErrorController' => __DIR__ . '/../..' . '/app/Controllers/ErrorController.php',
        'App\\Controllers\\HomeController' => __DIR__ . '/../..' . '/app/Controllers/HomeController.php',
        'App\\Models\\BaseModel' => __DIR__ . '/../..' . '/app/Models/BaseModel.php',
        'App\\Models\\HomeModel' => __DIR__ . '/../..' . '/app/Models/HomeModel.php',
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
        'Core\\Database\\Connection' => __DIR__ . '/../..' . '/core/Database/Connection.php',
        'Core\\FrontController' => __DIR__ . '/../..' . '/core/FrontController.php',
        'Core\\Router' => __DIR__ . '/../..' . '/core/Router.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitdf0e3945719bcfcc57666cc0e0fb8729::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitdf0e3945719bcfcc57666cc0e0fb8729::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitdf0e3945719bcfcc57666cc0e0fb8729::$classMap;

        }, null, ClassLoader::class);
    }
}
