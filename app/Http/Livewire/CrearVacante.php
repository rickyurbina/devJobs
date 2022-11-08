<?php

namespace App\Http\Livewire;

use App\Models\Salario;
use Livewire\Component;
use App\Models\Categoria;
use App\Models\Vacante;
use Livewire\WithFileUploads;

class CrearVacante extends Component
{
    public $titulo;
    public $salario;
    public $categoria;
    public $empresa;
    public $ultimo_dia;
    public $descripcion;
    public $imagen;

    use WithFileUploads;
    
    
    protected $rules = [
        'titulo' => 'required|string',
        'salario' => 'required',
        'categoria' => 'required',
        'empresa' => 'required',
        'ultimo_dia' => 'required',
        'descripcion' => 'required',
        'imagen' => 'required|image|max:1024',
    ];

    public function crearVacante()
    {
        $datos = $this->validate();

        // Almacenar la imagen
        $imagen = $this->imagen->store('public/vacantes');
        // al poner $datos['imagen'] reescribimos el valor que trae el campo imagen desde el formulario con 
        // el nombre de la imagen que se genera temporalmente por lovewire
        $datos['imagen'] = str_replace('public/vacantes/','', $imagen);


        // Crear la vacante
        Vacante::create([
            'titulo' => $datos['titulo'],
            'salario_id' => $datos['salario'],
            'categoria_id' => $datos['categoria'],
            'ultimo_dia' => $datos['ultimo_dia'],
            'empresa' => $datos['empresa'],
            'descripcion' => $datos['descripcion'],
            'imagen' => $datos['imagen'],

            // el usuario no lo estamos validando y no esta
            // en el formulario, livewire tiene acceso a todo lo de laravel y como el usuario debe estar
            // autenticado para poder registrar una vacante, tengo acceso a la funcion auth() 
            'user_id' => auth()->user()->id
        ]);


        //Crear un mensaje
        session()->flash('mensaje', 'La vacante se publicó correctamente');
        
        // Redireccionar al usuario 
        return redirect()->route('vacantes.index');

    }
        public function render()
    {

        // Consultar la BD para pasar la informaión a la vista
        // Despues de crear el modelo Salario en la terminal
        $salarios = Salario::all();
        $categorias = Categoria::all();

        return view('livewire.crear-vacante', [
            'salarios'=> $salarios,
            'categorias' => $categorias
        ]);
    }
}
