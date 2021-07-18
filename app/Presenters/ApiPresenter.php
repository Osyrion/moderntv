<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;

final class ApiPresenter extends Nette\Application\UI\Presenter
{

    private Nette\Database\Explorer $database;

	public function __construct(Nette\Database\Explorer $database)
	{
		$this->database = $database;
	}

    public function renderDefault() 
    {
        $data = $this->database->query('SELECT A.*, B.order as GroupOrder  
        FROM moderntvdb.channels as A LEFT JOIN moderntvdb.ChannelGroups as B ON 
        A.ChannelGroup = B.id')->fetchAll();
        
        $this->template->channels = $this->sendJson($data);

    }
	
}
