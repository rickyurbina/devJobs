<x-guest-layout>
    <x-auth-card>
        <x-slot name="logo">
            <a href="/">
                <x-application-logo class="w-20 h-20 fill-current text-gray-500" />
            </a>
        </x-slot>

        <div class="mb-4 text-sm text-gray-600">
            {{ __('Coloca tu email de registro para recuperar tu password mediante un link a tu cuenta de correo.') }}
        </div>

        <!-- Session Status -->
        <x-auth-session-status class="mb-4" :status="session('status')" />

        <!-- Validation Errors -->
        <x-auth-validation-errors class="mb-4" :errors="$errors" />

        <form method="POST" action="{{ route('password.email') }}">
            @csrf

            <!-- Email Address -->
            <div>
                <x-input-label for="email" :value="__('Email')" />

                <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus />
            </div>

            <div class="flex justify-between my-5">

                <x-link :href="route('register')">
                    Crear Cuenta</x-link>
                <x-link :href="route('login')">
                    Iniciar Sesión </x-link>
                
            </div>

            <x-primary-button class="w-full justify-center">
                {{ __('Recuperar password') }}
            </x-primary-button>
        </form>
    </x-auth-card>
</x-guest-layout>
