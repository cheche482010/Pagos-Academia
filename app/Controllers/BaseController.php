<?php
namespace App\Controllers;

use Core\BaseModel;
use App\Components\ButtonComponent;
use App\Components\LinkComponent;
use App\Components\ScriptComponent;
use App\Components\PageHeaderComponent;
use App\Components\NotificationsComponent;
use App\Components\NavbarNavComponent;
use App\Components\SidebarMenuComponent;
use App\Components\FooterComponent;
use App\Components\SmallBoxComponent;
use App\Components\ContentHeaderComponent;

class BaseController
{
    protected $model;
    protected $button;
    protected $link;
    protected $assets;
    protected $script;
    protected $pageheader;
    protected $notifications;
    protected $navbarnav;
    protected $sidebar;
    protected $footer;
    protected $smallbox;
    protected $contentheader;

    public function __construct()
    {
        $controllerName = substr(get_class($this), strrpos(get_class($this), '\\') + 1);
        $modelName = "App\Models\\" . str_replace("Controller", "Model", $controllerName);
        $this->model = new $modelName();
        $this->assets = $this->Assets();
    }

    protected function Button($data = [])
    {
        $this->button = new ButtonComponent($data);
        return $this->button;
    } 

    protected function Link($data = [])
    {
        $this->link = new LinkComponent($data);
        return $this->link;
    } 

    protected function Script($data = [])
    {
        $this->script = new ScriptComponent($data);
        return $this->script;
    } 

    protected function PageHeader($data = [])
    {
        $this->pageheader = new PageHeaderComponent($data);
        return $this->pageheader;
    } 

    protected function Notifications($data = [])
    {
        $this->notifications = new NotificationsComponent($data);
        return $this->notifications;
    }

    protected function NavbarNav($data = [])
    {
        $this->navbarnav = new NavbarNavComponent($data);
        return $this->navbarnav;
    }

    protected function SidebarMenu($data = [])
    {
        $this->sidebar = new SidebarMenuComponent($data);
        return $this->sidebar;
    }

    protected function Footer($data = [])
    {
        $this->footer = new FooterComponent($data);
        return $this->footer;
    }

    protected function SmallBox($data = [])
    {
        $this->smallbox = new SmallBoxComponent($data);
        return $this->smallbox;
    }

    protected function ContentHeader($data = [])
    {
        $this->contentheader = new ContentHeaderComponent($data);
        return $this->contentheader;
    }

    public function Assets()
    {
        $protocol = empty($_SERVER['HTTPS']) ? 'http://' : 'https://';
        $domain   = $_SERVER['HTTP_HOST'];
        $root     = str_replace('/index.php', '', $_SERVER['SCRIPT_NAME']) . "/";
        return $protocol . $domain . $root."assets/";
        unset($protocol, $domain, $root);
    }
}
