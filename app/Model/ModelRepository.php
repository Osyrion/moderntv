<?php

declare(strict_types=1);

namespace App\Model;

use Nette;


class ModelRepository
{
	use Nette\SmartObject;

    private Nette\Database\Explorer $database;

	public function __construct(Nette\Database\Explorer $database)
	{
		$this->database = $database;
	}

}


?>