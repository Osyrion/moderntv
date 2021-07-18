<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;

final class HomepagePresenter extends Nette\Application\UI\Presenter
{

    // @persistent
    private $text = [];

    private Nette\Database\Explorer $database;

	public function __construct(Nette\Database\Explorer $database)
	{
		$this->database = $database;
	}

    public function filterDatabase($search, $arr)
    {
        $search = '%' . $search . '%';

        if ($arr == NULL) {
            $arr = [10,20,30,40,60,70,80,85,90,100,110];
        }
        //$this->text = $this->database->query('SELECT A.*, B.order as GroupOrder  
        //FROM moderntvdb.channels as A LEFT JOIN moderntvdb.ChannelGroups as B ON A.ChannelGroup = B.id 
        //WHERE A.name LIKE ? AND B.order IN (?)', $search, $arr)->fetchAll();

        $this->text = $this->database->query('SELECT * FROM 
            (SELECT A.*, B.name as GroupName, B.order as GroupOrder  
                FROM moderntvdb.channels as A LEFT JOIN moderntvdb.ChannelGroups as B ON A.ChannelGroup = B.id) as iptv
        WHERE name LIKE ? AND GroupOrder IN (?) ORDER BY GroupOrder, iptv.order', $search, $arr)->fetchAll();

    }

    public function renderDefault() 
    {
        if ($this->text == NULL) {
            $this->template->channels = $this->text = $this->database->query('SELECT * FROM 
            (SELECT A.*, B.name as GroupName, B.order as GroupOrder  
                FROM moderntvdb.channels as A LEFT JOIN moderntvdb.ChannelGroups as B ON A.ChannelGroup = B.id) as iptv
            ORDER BY GroupOrder, iptv.order')->fetchAll();
        } else {
            $this->template->channels = $this->text;
        }
    }

    protected function createComponentFilterForm(): Form
	{
		$form = new Form;
		$form->addText('filter', 'Filter channels:')
             ->setHtmlAttribute('onkeyup', 'document.getElementById("searchFormBtn").click();');
        $form->addCheckboxList('genre', 'Žánr:', [
                10 => 'General',
                20 => 'Sport',
                30 => 'Children',
                40 => 'Documentary',
                60 => 'Movie',
                70 => 'News',
                80 => 'Music & Lifestyle',
                85 => 'Regional',
                90 => 'Foreign',
                100 => 'Erotic',
                110 => 'Other',
        ])
             ->setHtmlAttribute('onclick', 'document.getElementById("searchFormBtn").click();');
        $form->addSubmit('send', 'Filtrovat')
             ->setHtmlAttribute('class', 'ajax d-none')
             ->setHtmlAttribute('id', 'searchFormBtn');
		$form->onSuccess[] = [$this, 'formSucceeded'];
		return $form;
	}

	public function formSucceeded(Form $form, $data): void
	{
        $search = $data->filter;
        $arr = $data->genre;


	
        $this->filterDatabase($search, $arr);
        $this->redrawControl('itemWrapper');
	}

    
}
