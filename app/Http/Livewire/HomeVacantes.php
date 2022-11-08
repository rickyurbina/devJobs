<?php

namespace App\Http\Livewire;

use App\Models\Vacante;
use Livewire\Component;

class HomeVacantes extends Component
{
    public $termino;
    public $categoria;
    public $salario;
    
    protected $listeners =['terminosBusqueda' => 'buscar'];

    public function buscar($termino, $categoria, $salario)
    {
        $this->termino = $termino;
        $this->categoria = $categoria;
        $this->salario = $salario;
    }

    public function render()
    {
        // importamos el modelo para cargar todas las vacantes de la BD
        //$vacantes = Vacante::all();
        // el termino when verifica si hay algun valor en termino si no lo hay no ejecuta la funcion
        // si contiene algun valor entonces ejecuta la funcion que filtra los titutos que contengan lo que el usuario escribió
        // y esto lo hace con el LIKE
        $vacantes = Vacante::when($this->termino, function ($query){
            $query->where('titulo', 'LIKE', '%'. $this->termino . '%');
        })
        ->when($this->termino , function ($query){
            $query->orWhere('empresa', 'LIKE', '%'. $this->termino .'%');
        })
        ->when($this->categoria , function ($query){
            $query->where('categoria_id', $this->categoria);
        })
        ->when($this->salario , function ($query){
            $query->where('salario_id', $this->salario);
        })
        ->paginate(2);


        return view('livewire.home-vacantes', [
            'vacantes' => $vacantes
        ]);
    }
}
