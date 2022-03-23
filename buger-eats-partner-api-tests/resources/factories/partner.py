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