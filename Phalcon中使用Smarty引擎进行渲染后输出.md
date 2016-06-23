Phalcon Smarty Integration
=======================

### **Phalcon Smarty Integration**



**Phalcon\Mvc\View\Engine**

Adapters to use other template engines with Phalcon

Smarty
------
[Smarty](http://www.smarty.net/) is a template engine for PHP, facilitating the separation of presentation
(HTML/CSS) from application logic.

You need to manually include the Smarty library before use its engine adapter. Including its adapter:

```php
require_once 'Smarty3/Smarty.class.php';
```

Register the adapter in the view component:

```php
//Setting up the view component
$di->set('view', function() {

    $view = new \Phalcon\Mvc\View();

    $view->setViewsDir('../app/views/');

    $view->registerEngines(
		array(".tpl" => 'Phalcon\Mvc\View\Engine\Smarty')
	);

    return $view;
});
```

Smarty's equivalent to Phalcon's "setVar($key, $value)" function is "assign($key, $value, $nocache = false)" which has a third optional argument. This third argument, when set to true, marks the variable as exempt from caching. This is an essential Smarty feature that other template engines lack, being useful for pages that have portions that are often changing such as the current user who is logged in. If you want to utilize this additional argument, use the incubator SmartyView instead of View which extends View to include this functionality.

```php
//Setting up the view component
use Phalcon\Mvc\View\SmartyView;
$di->set('view', function() {

    $view = new SmartyView();

    $view->setViewsDir('../app/views/');

    $view->registerEngines(
		array(".tpl" => 'Phalcon\Mvc\View\Engine\Smarty')
	);

    return $view;
});
```

You may now use the setVar function you are familiar with in Phalcon with the third, optional argument:

```php
// This variable is exempt from caching
$this->view->setVar($key, $value, true);

// This variable can be cached, as $nocache is false by default
$this->view->setVar($key, $value);
```

Smarty can be configured to alter its default behavior, the following example explain how to do that:

```php
$di->set('view', function() use ($config) {

	$view = new \Phalcon\Mvc\View();
	$view->setViewsDir('../app/views/');

	$view->registerEngines(
		array('.html' => function($view, $di) {

				$smarty = new \Phalcon\Mvc\View\Engine\Smarty($view, $di);

				$smarty->setOptions(array(
					'template_dir'		=> $view->getViewsDir(),
					'compile_dir'		=> '../app/viewscompiled',
					'error_reporting'	=> error_reporting() ^ E_NOTICE,
					'escape_html'		=> true,
					'_file_perms'		=> 0666,
					'_dir_perms'		=> 0777,
					'force_compile'		=> false,
					'compile_check'		=> true,
					'caching'			=> false,
					'debugging'			=> true,
				));

				return $smarty;
			}
		)
	);

	return $view;
});
```
