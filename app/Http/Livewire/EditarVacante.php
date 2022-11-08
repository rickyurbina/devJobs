<?php

namespace App\Http\Livewire;

use App\Models\Salario;
use Livewire\Component;
use App\Models\Categoria;
use App\Models\Vacante;
use Illuminate\Support\Carbon;
use Livewire\WithFileUploads;

class EditarVacante extends Component
{
    // estos atributos los definimos para obtener la informacion de la vista y usarla en el componente de livewire
    
    public $vacante_id;  // $id solo, es una palabra reservada dentro de livewire
    public $titulo;
    public $salario;
    public $categoria;
    public $empresa;
    public $ultimo_dia;
    public $descripcion;
    public $imagen;
    public $imagen_nueva;

    use WithFileUploads;


    protected $rules = [
        'titulo' => 'required|string',
        'salario' => 'required',
        'categoria' => 'required',
        'empresa' => 'required',
        'ultimo_dia' => 'required',
        'descripcion' => 'required',
        'imagen_nueva' => 'nullable|image|max:1024',   // la validación nullable permite que no haya algun valor pero si existe,
                                                        // el valor debe ser una imagen y de maximo 1024
    ];

    // El siguiente metodo se llama Lifecycle Hook, allow you to run code at any part of the component's lifecyle, 
    // or before specific properties are updated.
    //Runs once, immediately after the component is instantiated, but before render() is called. 
    //This is only called once on initial page load and never called again, even on component refreshes
    public function mount(Vacante $vacante)
    {
        $this->vacante_id = $vacante->id;
        $this->titulo = $vacante->titulo;
        $this->salario = $vacante->salario_id;
        $this->categoria = $vacante->categoria_id;
        $this->empresa = $vacante->empresa;
        $this->ultimo_dia = Carbon::parse( $vacante->ultimo_dia )->format('Y-m-d');
        $this->descripcion = $vacante->descripcion;
        $this->imagen = $vacante->imagen;
    }

    public function editarVacante()
    {
        $datos = $this->validate();

        // Reisar si hay una imagen nueva
        if ($this->imagen_nueva)
        {
            $imagen = $this->imagen_nueva->store('public/vacantes');
            $datos['imagen'] = str_replace('public/vacantes/', '', $imagen);
        }
        // Encontrar la vacante a editar
        $vacante = Vacante::find($this->vacante_id);
        // Asignar los valores
        $vacante->titulo = $datos['titulo'];
        $vacante->salario_id = $datos['salario'];
        $vacante->categoria_id = $datos['categoria'];
        $vacante->empresa = $datos['empresa'];
        $vacante->ultimo_dia = $datos['ultimo_dia'];
        $vacante->descripcion = $datos['descripcion'];
        $vacante->imagen = $datos['imagen'] ?? $vacante->imagen;
        // Guardar los cambios
        $vacante->save();

        // Redireccionar
        session()->flash('mensaje','La vacante se actualió correctamente');
        return redirect()->route('vacantes.index');
    }


    public function render()
    {

        // Consultar la BD para pasar la informaión a la vista
        // Despues de crear el modelo Salario en la terminal
        $salarios = Salario::all();
        $categorias = Categoria::all();

        
        return view('livewire.editar-vacante', [
            'salarios'=> $salarios,
            'categorias' => $categorias
        ]);
    }
}
