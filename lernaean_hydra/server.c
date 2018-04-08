/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ksonu <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/03 17:02:03 by ksonu             #+#    #+#             */
/*   Updated: 2018/03/04 19:28:02 by ksonu            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>

int	main(int ac, char **av)
{
	char	server_message[20] = "pong pong\n";
	int	server_socket;
	struct	sockaddr_in	server_address;
	struct	sockaddr_in	client_address;
	int	client_socket;
	int	client_addr_size;
	/* create the server socket */
	if (ac == 2)
	{

		server_socket = socket(PF_INET, SOCK_STREAM, 0);
		if (server_socket == -1)
			return (-1);
		memset(&server_address, 0, sizeof(server_address));
		/* define the server address */
		server_address.sin_family = AF_INET;
		server_address.sin_port = htons(atoi(av[1]));
		server_address.sin_addr.s_addr = INADDR_ANY;

		/* bind the socket to our specified IP and port */
		bind(server_socket, (struct sockaddr *)&server_address, sizeof(server_address));

		listen(server_socket, 5);

		client_addr_size = sizeof(client_address);
		client_socket = accept(server_socket, (struct sockaddr *) &client_address, &client_addr_size);

		/* send the message */
		write(client_socket, server_message, sizeof(server_message));

		/* close the socket */
		close(server_socket);
	}

	return (0);
}
