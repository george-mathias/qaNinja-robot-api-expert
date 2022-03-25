def factory_new_partner():
    partner = {
        'name': "Pizzas Papito's",
        'email': 'contato@papitos.com.br',
        'whatsapp': '11899999999',
        'business': 'Restaurante'
    }
    return partner

def factory_duplicate_name():
    partner = {
        'name': "Pizza do João",
        'email': 'contato@joao.com.br',
        'whatsapp': '61899999999',
        'business': 'Conveniência'
    }
    return partner

def factory_partner_list():
    p_list = [
        {
        'name': "Mercearia da Mary Jane",
        'email': 'contato@mmj.com',
        'whatsapp': '11999991001',
        'business': 'Conveniência'
        },
        {
        'name': "Mercadinho São Francisco",
        'email': 'contato@msf.com.br',
        'whatsapp': '11999991002',
        'business': 'Supermercado'
        },
        {
        'name': "Bom de parto",
        'email': 'contato@bomdeprato.com.br',
        'whatsapp': '11999991003',
        'business': 'Restaurante'
        }    
    ]
    return p_list

def factory_enable_partner():
    partner = {
        'name': "Doceria do Papito",
        'email': 'doceria@yahoo.com',
        'whatsapp': '11899999999',
        'business': 'Conveniência'
    }
    return partner

def factory_disable_partner():
    partner = {
        'name': "Mercado Noite",
        'email': 'contato@mercadonoite.com',
        'whatsapp': '11899999999',
        'business': 'Supermercado'
    }
    return partner

def factory_remove_partner():
    partner = {
        'name': "Adega do Papito",
        'email': 'contato@adp.com.br',
        'whatsapp': '11899999999',
        'business': 'Restaurante'
    }
    return partner

def factory_404_partner():
    partner = {
        'name': "Frangão",
        'email': 'contato@frangao.com',
        'whatsapp': '11899999999',
        'business': 'Restaurante'
    }
    return partner